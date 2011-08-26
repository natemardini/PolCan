require 'text_helper'

class Bill < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  
  # Accessible attributes
  attr_accessible :short_title, :long_title, :preamble, :bill_number, :bill_type

  # Associations
  has_many :provisions, :dependent => :destroy
  belongs_to :member
  has_one :stage, :dependent => :destroy
  has_many :tallies
  belongs_to :house_session
  has_one :forum
  
  # Complementary associations
  has_many :orders, :through => :provisions
  
  # Method calls during saves
  before_save :fix_preamble
  
  # Methods  
  def introduce
    # The Clerks shall look up the current bill roll for this session
    session_bills = HouseSession.current_session.bills
    
    # They then assign a bill number based on the current count, 
    # and whether it is a public or private bill
    case bill_type
    when 1
      self.bill_number = session_bills.find_all_by_bill_type("1").count + 1
    when 2
      self.bill_number = session_bills.find_all_by_bill_type("2").count + 201
    end
    
    # They then add the bill to the current session's roll
    self.confidence = false
    session_bills << self
    
    # Add the short title as the first provision and create the stage for future votes
    self.short_title_section
    self.create_stage({reading: 0, last_movement: DateTime.now})
    
    # Start a forum for the bill
    self.create_forum
    disc = Discussion.new(subject: "#{self}")
    self.forum.discussions << disc
    disc.messages << Message.new(body: "Bill duly drafted with the assistance of the Library of Parliament. No civil servants were harmed in the process.")    
    
    # Finally we shall verify whether the clerks were not drunk and saved everything correctly
    if !self.id.nil? and !self.stage.id.nil? and !self.forum.id.nil?
      return true
    else
      return false
    end
  end
  
  def fix_preamble
    self.preamble = preamble.gsub('Whereas', '<em>Whereas</em>')
  end
  
  def short_title_section
    if !short_title.nil? and short_title.size > 4
      articles = self.provisions.size + 1
      self.provisions << Provision.create(:article => articles, :text => "This Act may be cited as the <em>#{short_title}</em>.", :in_effect => 1)
    end
  end
  
  def to_s
    if house == 2
      "Bill S-#{bill_number}"
    else
      "Bill C-#{bill_number}"
    end
  end
  
  def enactment_provision
    # Find the provision entities and split them into enactment types
    sd = self.provisions.where(in_effect: 2)
    oc = self.provisions.where(in_effect: 3)
    
    if !oc.empty?
      # Create the first string based on order in council (easiest)
      sections = []
      oc.each do |s|
        sections << s.article
      end
      
      # Sort the array into sections and build them into the string
      sections.sort!
      sections_text = sections.take(sections.length - 1).join(', ')
      sections_text += " and #{sections.last}" 
      oc_paragraph = "<p>#{pluralize(sections.length, 'Section')} #{sections_text} shall come into full and effect by order of the Governor General in Council.</p>"
    else
      oc_paragraph = ""
    end
    
    if !sd.empty?
      # Create a hash with the section numbers and dates of each provision
      articles = Hash.new
      sd.each do |s|
        articles[s.article.to_s] = s.effect_date.strftime('%B %d, %Y')
      end
      
      # For each date, make a string with the sections coming into effect
      sd_string = String.new
      articles.inverse.each_pair do |date, secs|
        sd_string += "#{pluralize(secs.length, 'Section')} #{secs.join(', ')} shall come into full force and effect on #{date}. "
      end
      sd_paragraph = "<p>" + sd_string.strip + "</p>"
    else
      sd_paragraph = ""
    end
    
    # Merge the two strings
    final_paragraph = sd_paragraph + oc_paragraph
    
    # Add a new provision to the bill with the enactments
    if final_paragraph != ""
      self.provisions << Provision.create( :article => self.provisions.size + 1, :text => final_paragraph, :in_effect => 1 )
      return true
    else
      return false
    end
  end
   
  def self.movebills
    # Get this session's bills'
    return false if HouseSession.current_session.nil?
    sessionbills = HouseSession.current_session.bills
    
    # Set current time for calculations
    now = DateTime.now 
    
    # Go through first reading
    first_bills = sessionbills.includes(:stage).where('stages.reading = ?', 1)
    first_bills.each do |bill|
      if bill.stage.last_movement <= 22.hour.ago(now)
        bill.stage.update_attributes(reading: 2, last_movement: now)
      end
    end
    
    # Now for second reading
    second_bills = sessionbills.includes(:stage).where('stages.reading = ?', 2)
    second_bills.each do |bill|
      if bill.stage.last_movement <= 5.day.ago(now)
        yeas = 0
        nays = 0
        abs = 0
        Party.all.each do |p|
          quotient = p.seats / p.members.where('last_sign_in_at > ?', 2.week.ago(now)).count
          yeas += bill.stage.find_ballots_by_vote('1').includes(:member).where('member.party = ?', p).count * quotient
          nays += bill.stage.find_ballots_by_vote('2').includes(:member).where('member.party = ?', p).count * quotient
          abs += bill.stage.find_ballots_by_vote('3').includes(:member).where('member.party = ?', p).count * quotient
        end
        
        if yeas > nays
          bill.tallies << Tally.create(reading: 2, ballots: bill.stage.ballots, yeas: yeas, nays: nays, abstains: abs)
          bill.stage.update_attributes(reading: 3, last_movement: now) 
          bill.stage.ballots.delete_all
        elsif yeas < nays
          bill.tallies << Tally.create(reading: 2, ballots: bill.stage.ballots, yeas: yeas, nays: nays, abstains: abs)
          bill.stage.update_attributes(reading: 99, last_movement: now) 
          bill.stage.ballots.delete_all
        end
      end      
    end
    
    # Now for third reading
    third_bills = sessionbills.includes(:stage).where('stages.reading = ?', 3)
    third_bills.each do |bill|
      if bill.stage.last_movement <= 3.day.ago(now)
        yeas = 0
        nays = 0
        abs = 0
        Party.all.each do |p|
          quotient = p.seats / p.members.where('last_sign_in_at > ?', 2.week.ago(now)).count
          yeas += bill.stage.find_ballots_by_vote('1').includes(:member).where('member.party = ?', p).count * quotient
          nays += bill.stage.find_ballots_by_vote('2').includes(:member).where('member.party = ?', p).count * quotient
          abs += bill.stage.find_ballots_by_vote('3').includes(:member).where('member.party = ?', p).count * quotient
        end
        
        if yeas > nays
          bill.tallies << Tally.create(reading: 3, ballots: bill.stage.ballots, yeas: yeas, nays: nays, abstains: abs)
          bill.stage.update_attributes(reading: 4, last_movement: now) 
          bill.stage.ballots.delete_all
        elsif yeas < nays
          bill.tallies << Tally.create(reading: 3, ballots: bill.stage.ballots, yeas: yeas, nays: nays, abstains: abs)
          bill.stage.update_attributes(reading: 99, last_movement: now) 
          bill.stage.ballots.delete_all
        end
      end      
    end
    
    # Now for the Senate
    senate_bills = sessionbills.includes(:stage).where('stages.reading = ?', 4)
    senate_bills.each do |bill|
      if bill.stage.last_movement < 1.day.ago(now)
        result = Senate.vote(bill)
        if !result.nil?
          if result[:yeas] > result[:nays]
            bill.tallies << Tally.create(reading: 4, yeas: result[:yeas], nays: result[:nays], abstains: result[:abstains])
            bill.stage.update_attributes(reading: 5, last_movement: now) 
          else
            bill.tallies << Tally.create(reading: 4, yeas: result[:yeas], nays: result[:nays], abstains: result[:abstains])
            bill.stage.update_attributes(reading: 99, last_movement: now) 
          end
        end
      end     
    end
    
    # And finally for royal assent
    final_bills = sessionbills.includes(:stage).where('stages.reading = ?', 5)
    final_bills.each do |bill|
      if bill.stage.last_movement < 12.hour.ago(now)
        bill.stage.update_attributes(reading: 6, last_movement: now)
      end
    end
    
    return true
  end
    
    
  
end



# == Schema Information
#
# Table name: bills
#
#  id               :integer         not null, primary key
#  bill_number      :integer
#  house            :integer
#  bill_type        :integer
#  long_title       :string(255)
#  short_title      :string(255)
#  preamble         :text
#  created_at       :datetime
#  updated_at       :datetime
#  confidence       :boolean
#  member_id        :integer
#  house_session_id :integer
#


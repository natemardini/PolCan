require 'text_helper'

class Bill < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  
  # Accessible attributes
  attr_accessible :short_title, :long_title, :preamble, :bill_number, :bill_type

  # Associations
  has_many :provisions
  belongs_to :member
  has_one :stage
  has_many :tallies
  belongs_to :house_session
  has_many :messages
  
  # Complementary associations
  has_many :orders, :through => :provisions
  
  # Method calls during saves
  before_save :number_bill 
  after_save :short_title_section, :introduce_draft 
  
  # Methods  
  def introduce_draft
    self.create_stage({reading: 0, last_movement: DateTime.now})
  end
  
  def number_bill
    session_bills = HouseSession.current_session.bills
    case bill_type
    when 1
      self.bill_number = session_bills.find_all_by_bill_type("1").count + 1
    when 2
      self.bill_number = session_bills.find_all_by_bill_type("2").count + 201
    end
  end
  
  def short_title_section
    if !short_title.nil? and short_title.size > 4
      articles = self.provisions.size + 1
      self.provisions << Provision.create(:article => articles, :text => "This Act may be cited as the <em>#{@short_title}</em>.", :in_effect => 1)
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


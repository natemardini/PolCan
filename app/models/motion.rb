class Motion < ActiveRecord::Base

  # Accessible properties
  attr_accessible :motion_number, :body, :confidence
  
  # Associations
  belongs_to :member
  belongs_to :house_session
  has_one :stage
  has_many :tallies
  has_one :forum
  
  # Methods
  
  def introduce
    # Find all motions in this session
    session_motions = HouseSession.current_session.motions.order('motion_number DESC').all
    
    # Provide a motion number
    if session_motions.empty?
      self.motion_number = 1
    else
      self.motion_number = session_motions.first.motion_number + 1
    end
    
    # Set confidence to false
    self.confidence = false
    
    # Enter the rolls
    HouseSession.current_session.motions << self
    
    # Create stage
    self.create_stage(reading: 11, last_movement: DateTime.now) 
    
    # Create_forum
    self.create_forum
    disc = Discussion.new(subject: "#{self}")
    self.forum.discussions << disc
    disc.messages << Message.create(body: "Motion registered in the Notice Paper.")   
    
    # Validations
    if !self.id.nil? and !self.stage.id.nil? and !self.forum.id.nil?
      return true
    else
      return false
    end 
  end
  
  def to_s
    "M-#{motion_number}"
  end
  
end


# == Schema Information
#
# Table name: motions
#
#  id               :integer         not null, primary key
#  motion_number    :integer
#  body             :text
#  confidence       :boolean
#  created_at       :datetime
#  updated_at       :datetime
#  member_id        :integer
#  house_session_id :integer
#


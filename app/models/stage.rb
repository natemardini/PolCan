class Stage < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :reading, :last_movement
  
  # Associations
  belongs_to :bill
  belongs_to :motion
  has_many :ballots
  
  # Methods
  def count_ballots
    yeas = self.ballots.where(:vote => 1).count
    nays = self.ballots.where(:vote => 2).count
    abstains = self.ballots.where(:vote => 3).count
    { :yeas => yeas, :nays => nays, :abstains => abstains }
  end
  
  def to_s
    case reading
    when 0
      "Draft"
    when 1
      "First Reading"
    when 2
      "Second Reading"
    when 3
      "Third Reading"
    when 4
      "Senate"
    when 5
      "Assented to"
    when 11                   # 11-13 strictly for motions
      "Notice Paper"
    when 12
      "Order Paper"
    when 13 
      "Adopted"
    when 99
      "Defeated"
    end
  end
  
end


# == Schema Information
#
# Table name: stages
#
#  id            :integer         not null, primary key
#  reading       :integer
#  last_movement :datetime
#  created_at    :datetime
#  updated_at    :datetime
#  bill_id       :integer
#  motion_id     :integer
#


class Stage < ActiveRecord::Base
  attr_accessible :reading, :last_movement
  
  belongs_to :bill
  belongs_to :motion
  has_many :ballots
  
  def count_ballots
    yeas = self.ballots.where(:vote => 1).count
    nays = self.ballots.where(:vote => 2).count
    abstains = self.ballots.where(:vote => 3).count
    { :yeas => yeas, :nays => nays, :abstains => abstains }
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


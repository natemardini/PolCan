class Ballot < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :vote
  
  # Associations
  belongs_to :member
  belongs_to :stage
  belongs_to :tally
end


# TOdo: hello



# == Schema Information
#
# Table name: ballots
#
#  id         :integer         not null, primary key
#  vote       :integer
#  created_at :datetime
#  updated_at :datetime
#  member_id  :integer
#  tally_id   :integer
#  stage_id   :integer
#


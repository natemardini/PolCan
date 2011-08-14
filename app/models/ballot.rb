class Ballot < ActiveRecord::Base
  belongs_to :member
  belongs_to :stage
  belongs_to :tally
end


# == Schema Information
#
# Table name: ballots
#
#  id         :integer         not null, primary key
#  vote       :integer
#  created_at :datetime
#  updated_at :datetime
#

# TOdo: hello



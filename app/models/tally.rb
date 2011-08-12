class Tally < ActiveRecord::Base
  belongs_to :bill
  belongs_to :motion
  has_many :ballots
end

# == Schema Information
#
# Table name: tallies
#
#  id         :integer         not null, primary key
#  yeas       :integer
#  nays       :integer
#  abstains   :integer
#  created_at :datetime
#  updated_at :datetime
#  reading    :integer
#


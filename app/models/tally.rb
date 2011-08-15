class Tally < ActiveRecord::Base
  attr_accessible :yeas, :nays, :abstains, :reading
  
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
#  bill_id    :integer
#  motion_id  :integer
#


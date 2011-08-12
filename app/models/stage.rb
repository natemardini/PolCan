class Stage < ActiveRecord::Base
  belongs_to :bill
  belongs_to :motion
  has_many :ballots
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
#


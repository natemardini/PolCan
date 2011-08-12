class Motion < ActiveRecord::Base
  belongs_to :member
  belongs_to :house_session
  has_one :stage
  has_many :tallies
end

# == Schema Information
#
# Table name: motions
#
#  id            :integer         not null, primary key
#  motion_number :integer
#  body          :text
#  confidence    :boolean
#  created_at    :datetime
#  updated_at    :datetime
#


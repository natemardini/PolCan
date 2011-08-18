class Motion < ActiveRecord::Base
  attr_accessible :motion_number, :body, :confidence
  
  belongs_to :member
  belongs_to :house_session
  has_one :stage
  has_many :tallies
  has_one :forum
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


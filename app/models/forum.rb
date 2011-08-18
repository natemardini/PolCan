class Forum < ActiveRecord::Base
  # Accessible attributes
  
  # Associations
  has_many :discussions
  belongs_to :party
  belongs_to :motion
  belongs_to :bill
  belongs_to :house_group
  belongs_to :house_session
end

# == Schema Information
#
# Table name: forums
#
#  id               :integer         not null, primary key
#  party_id         :integer
#  motion_id        :integer
#  bill_id          :integer
#  house_session_id :integer
#  house_group_id   :integer
#  created_at       :datetime
#  updated_at       :datetime
#


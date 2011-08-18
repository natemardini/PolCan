class Message < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :subject, :body, :destination
 
  # Associations
  belongs_to :member
  belongs_to :discussion
end






# == Schema Information
#
# Table name: messages
#
#  id            :integer         not null, primary key
#  body          :text
#  created_at    :datetime
#  updated_at    :datetime
#  member_id     :integer
#  discussion_id :integer
#  destination   :integer
#


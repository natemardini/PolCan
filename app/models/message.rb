class Message < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :subject, :body
 
  # Associations
  has_ancestry
  belongs_to :member
  belongs_to :bill
  belongs_to :motion
  belongs_to :house_session
end



# == Schema Information
#
# Table name: messages
#
#  id               :integer         not null, primary key
#  subject          :string(255)
#  body             :text
#  special          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  ancestry         :string(255)
#  bill_id          :integer
#  motion_id        :integer
#  house_session_id :integer
#  member_id        :integer
#


class Message < ActiveRecord::Base
  acts_as_tree :order => "name"
  
  belongs_to :member
  belongs_to :bill
  belongs_to :motion
  belongs_to :house_session
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  body       :text
#  special    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#


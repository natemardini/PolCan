class Discussion < ActiveRecord::Base
  # Accessible attributes
  
  # Associations
  has_many :messages, :dependent => :destroy
  belongs_to :forum
  belongs_to :member
  
  # Nested attributes
  accepts_nested_attributes_for :messages
  
  # Methods
  
end

# == Schema Information
#
# Table name: discussions
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  member_id  :integer
#  forum_id   :integer
#  closed     :boolean
#  created_at :datetime
#  updated_at :datetime
#


class Department < ActiveRecord::Base
  # Accessible properties
  attr_accessible :name, :treasury
  
  # Associations
  belongs_to :member
  has_many :orders
  has_many :briefings
  
end

# == Schema Information
#
# Table name: departments
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  treasury   :decimal(, )
#  member_id  :integer
#  created_at :datetime
#  updated_at :datetime
#


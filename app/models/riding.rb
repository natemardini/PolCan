class Riding < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :name
  
  # Associations
  belongs_to :province
  belongs_to :member
  belongs_to :party
end

# == Schema Information
#
# Table name: ridings
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  province_id :integer
#  member_id   :integer
#


class HouseGroup < ActiveRecord::Base
  has_many :parties
  belongs_to :house_session
end

# == Schema Information
#
# Table name: house_groups
#
#  id         :integer         not null, primary key
#  side       :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


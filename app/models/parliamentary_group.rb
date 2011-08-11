class ParliamentaryGroup < ActiveRecord::Base
  has_many :parties
  belongs_to :legislative_session
end

# == Schema Information
#
# Table name: parliamentary_groups
#
#  id         :integer         not null, primary key
#  side       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


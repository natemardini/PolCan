class Member < ActiveRecord::Base
  has_and_belongs_to_many :roles
  belongs_to :party
  has_many :bills
  has_many :orders
  has_many :ballots
end

# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  username   :string(255)
#  password   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#


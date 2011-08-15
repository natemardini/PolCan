class Role < ActiveRecord::Base
  attr_accessible :long_name, :short_name, :access_level
  
  has_and_belongs_to_many :members
end

# == Schema Information
#
# Table name: roles
#
#  id           :integer         not null, primary key
#  long_name    :string(255)
#  short_name   :string(255)
#  access_level :integer
#  created_at   :datetime
#  updated_at   :datetime
#


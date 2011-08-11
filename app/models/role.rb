class Role < ActiveRecord::Base
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


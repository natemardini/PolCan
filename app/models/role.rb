class Role < ActiveRecord::Base
  attr_accessible :long_name, :short_name, :access_level
  # access_level : 1 -> MP, 2 -> Critic, 3 -> House Leader, 4 -> Leader
  # 5 -> Minister, 6 -> PM, 7 -> Editor, 8 -> Speaker, 9 -> GG
  
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


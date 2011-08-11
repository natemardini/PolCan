class Party < ActiveRecord::Base
  belongs_to :parliamentary_group
  has_many :members
end

# == Schema Information
#
# Table name: parties
#
#  id         :integer         not null, primary key
#  short_name :string(255)
#  long_name  :string(255)
#  letters    :string(255)
#  seats      :integer
#  created_at :datetime
#  updated_at :datetime
#


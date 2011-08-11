class Provision < ActiveRecord::Base
  belongs_to :bill
  has_one :enactment
end


# == Schema Information
#
# Table name: provisions
#
#  id         :integer         not null, primary key
#  article    :integer
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#  in_effect  :integer
#


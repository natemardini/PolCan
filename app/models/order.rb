class Order < ActiveRecord::Base
  has_many :enactments
  belongs_to :member
  has_many :provisions, :through => :enactments 
end

# == Schema Information
#
# Table name: orders
#
#  id            :integer         not null, primary key
#  style         :string(255)
#  text          :text
#  enacting_date :datetime
#  created_at    :datetime
#  updated_at    :datetime
#


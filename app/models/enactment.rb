class Enactment < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :enactment_type, :enacting_date
  
  # Associations
  belongs_to :provision
  belongs_to :order
end


# == Schema Information
#
# Table name: enactments
#
#  id             :integer         not null, primary key
#  enactment_type :integer
#  enacting_date  :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  provision_id   :integer
#  order_id       :integer
#


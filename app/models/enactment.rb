class Enactment < ActiveRecord::Base
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
#


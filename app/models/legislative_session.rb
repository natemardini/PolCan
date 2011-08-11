class LegislativeSession < ActiveRecord::Base
  has_many :bills
  has_many :parliamentary_groups
end

# == Schema Information
#
# Table name: legislative_sessions
#
#  id          :integer         not null, primary key
#  legislature :integer
#  session     :integer
#  opening     :datetime
#  ending      :datetime
#  seatcount   :integer
#  dissolved   :boolean
#  created_at  :datetime
#  updated_at  :datetime
#


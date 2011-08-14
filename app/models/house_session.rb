class HouseSession < ActiveRecord::Base
  has_many :bills
  has_many :motions
  has_many :house_groups
  has_many :messages
  
  def self.current_session
    find(:first, {:conditions => ['ending > ?', DateTime.now]})
  end
end

# TODO: Add discussion fora

# == Schema Information
#
# Table name: house_sessions
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


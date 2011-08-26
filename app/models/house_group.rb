class HouseGroup < ActiveRecord::Base
  attr_accessible :side, :name
  
  # Associations
  has_many :parties
  has_one :forum
  belongs_to :house_session
  
  # Methods
  
  def self.governmentstyle
    government = self.find_by_name('Government').parties.order('seats DESC')
    majorparty = government.first
    if government.sum(:seats) > (HouseSession.last_session!.seatcount / 2)
      "#{majorparty.short_name} Majority"
    else
      "#{majorparty.short_name} Minority"
    end
  end
  
end


# == Schema Information
#
# Table name: house_groups
#
#  id               :integer         not null, primary key
#  side             :integer
#  name             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  house_session_id :integer
#


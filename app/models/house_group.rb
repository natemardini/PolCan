class HouseGroup < ActiveRecord::Base
  has_many :parties
  belongs_to :house_session
end

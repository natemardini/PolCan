class HouseSession < ActiveRecord::Base
  has_many :bills
  has_many :parliamentary_groups
end

class HouseSession < ActiveRecord::Base
  has_many :bills
  has_many :parliamentary_groups
  
  scope :current_session, first( :conditions => ['ending > ?', DateTime.now] )
end

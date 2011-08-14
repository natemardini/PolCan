class Riding < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :name
  
  # Associations
  belongs_to :province
  belongs_to :member
end

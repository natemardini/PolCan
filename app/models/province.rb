class Province < ActiveRecord::Base
  # Accessible characteristics
  attr_accessible :name, :premier
  
  # Associations
  has_many :ridings
  has_many :members, :through => :ridings
end

class Order < ActiveRecord::Base
  has_many :enactments
  belongs_to :member
  has_many :provisions, through => :enactments 
end

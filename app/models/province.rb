class Province < ActiveRecord::Base
  # Accessible characteristics
  attr_accessible :name, :premier, :letters
  
  # Associations
  has_many :ridings
  has_many :members, :through => :ridings
  


  
end

# == Schema Information
#
# Table name: provinces
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  premier    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  letters    :string(255)
#


class OralQuestion < ActiveRecord::Base
  
  # Accessible attributes
  attr_accessible :answerer, :questioner, :timelimit, :question, :answer 
  
  # Associations
  belongs_to :answerer, :class_name => 'Member'
  belongs_to :questioner, :class_name => 'Member'
  belongs_to :house_session
  
end

class OralQuestion < ActiveRecord::Base
  
  # Accessible attributes
  attr_accessible :answerer, :questioner, :timelimit, :question, :answer, :department 
  
  # Associations
  belongs_to :answerer, :class_name => 'Member'
  belongs_to :questioner, :class_name => 'Member'
  belongs_to :house_session
  
end

# == Schema Information
#
# Table name: oral_questions
#
#  id            :integer         not null, primary key
#  question      :text
#  answer        :text
#  questioner_id :integer
#  answerer_id   :integer
#  timelimit     :datetime
#  created_at    :datetime
#  updated_at    :datetime
#


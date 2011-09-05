class Briefing < ActiveRecord::Base
  
  # Accessible attributes
  attr_accessible :body, :expiry, :npc_name, :npc_title, :resolved
  
  # Associations
  belongs_to :department
  
end

# == Schema Information
#
# Table name: briefings
#
#  id            :integer         not null, primary key
#  department_id :integer
#  member_id     :integer
#  body          :text
#  expiry        :datetime
#  resolved      :boolean
#  npc_name      :string(255)
#  npc_title     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#


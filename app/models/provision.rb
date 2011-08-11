class Provision < ActiveRecord::Base
  belongs_to :bill
  has_one :enactment
  
  def enacted 
    case in_effect
      when 2
        day = self.enactment.enacting_date.strftime("%B %d, %Y")
        "This section comes into full force and effect on #{day}."
      when 3
        "This section comes into full force and effect by order of the Governor-in-Council."  
      else
        "This section comes into full force and effect upon Royal Assent."
  end
end


# == Schema Information
#
# Table name: provisions
#
#  id         :integer         not null, primary key
#  article    :integer
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#  in_effect  :integer
#


class Provision < ActiveRecord::Base
  attr_accessible :article, :text, :in_effect, :effect_date
  
  belongs_to :bill
  belongs_to :order
  
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
end




# == Schema Information
#
# Table name: provisions
#
#  id          :integer         not null, primary key
#  article     :integer
#  text        :text
#  created_at  :datetime
#  updated_at  :datetime
#  in_effect   :integer
#  bill_id     :integer
#  effect_date :datetime
#  order_id    :integer
#


class Provision < ActiveRecord::Base
  attr_accessible :article, :text, :in_effect, :effect_date
  
  belongs_to :bill
  belongs_to :order
  
  def enacted? 
    case in_effect
    when 2
      "Enters into effect on #{effect_date.strftime("%b. %d, %Y")}."
    when 3
      "By Order-in-Council."  
    else 
      "Upon Royal Assent."
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


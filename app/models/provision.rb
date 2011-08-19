class Provision < ActiveRecord::Base
  attr_accessible :article, :text, :in_effect, :effect_date
  
  belongs_to :bill
  belongs_to :order
  
  before_save :clean
  
  # Methods
  
  def clean
    self.text = text.chomp.reverse.chomp.reverse
  end
  
  def enacted? 
    case in_effect
    when 3
      "Enters into effect on #{effect_date.strftime("%b. %d, %Y")}."
    when 2
      "By Order-in-Council."  
    when 1 
      "Upon Royal Assent."
    when 0
      "This section has been struck out."
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


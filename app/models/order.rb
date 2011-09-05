class Order < ActiveRecord::Base
  # Accessibble attributes
  attr_accessible :style, :text, :enacting_date, :type
  
  # Associations
  belongs_to :member
  belongs_to :department
  has_many :provisions 
  
  # Complementary associations
  has_many :bills, :through => :provisions
  
  # Methods
  def enact(bill)
    bill.provisions.where(in_effect: 3).all.each do |enaction|
      enaction.update_attribute(:effect_date, enacting_date)
    end
  end
  
  def get_type
    case type
    when 1
      "Order-in-Council"
    when 2
      "Proclamation"
    when 3
      "Instruction"
    end
  end  
  
  def grant_style
    order_numeral = Order.all.count + 1
    self.style = "P.C. #{DateTime.now.year}-#{order_numeral}"
  end
  
end



# == Schema Information
#
# Table name: orders
#
#  id            :integer         not null, primary key
#  style         :string(255)
#  text          :text
#  enacting_date :datetime
#  created_at    :datetime
#  updated_at    :datetime
#  member_id     :integer
#  type          :integer
#


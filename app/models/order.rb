class Order < ActiveRecord::Base
  # Accessibble attributes
  attr_accessible :style, :text, :enacting_date
  
  # Associations
  belongs_to :member
  has_many :provisions 
  
  # Complementary associations
  has_many :bills, :through => :provisions
  
  # Methods
  def enact(bill)
    bill.provisions.where(in_effect: 3).each do |enaction|
      enaction.effect_date = @enacting_date
    end
    bill.save
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
#


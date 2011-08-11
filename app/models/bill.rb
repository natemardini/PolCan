class Bill < ActiveRecord::Base
  belongs_to :legislative_session
  has_many :provisions
  belongs_to :member
  has_one :stage
  has_many :vote_histories
  
  def number_bill
    session = Legislative_Session.first(:conditions => ["ending > ?", DateTime.today])
    case self.bill_type
    when 1
      current_bills = session.bills.find_all_by_bill_type("1").count 
      self.bill_number = current_bills + 1
    when 2
      current_bills = session.bills.find_all_by_bill_type("2").count 
      self.bill_number = current_bills + 201
  end
end

# == Schema Information
#
# Table name: bills
#
#  id          :integer         not null, primary key
#  bill_number :integer
#  house       :integer
#  bill_type   :integer
#  long_title  :string(255)
#  short_title :string(255)
#  preamble    :text
#  created_at  :datetime
#  updated_at  :datetime
#


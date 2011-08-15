class Transaction < ActiveRecord::Base
  attr_accessible :item, :type, :amount
  
  belongs_to :wallet
end


# == Schema Information
#
# Table name: transactions
#
#  id         :integer         not null, primary key
#  item       :string(255)
#  type       :integer
#  amount     :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#  wallet_id  :integer
#


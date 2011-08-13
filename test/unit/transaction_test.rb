require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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
#


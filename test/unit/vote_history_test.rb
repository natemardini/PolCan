require 'test_helper'

class VoteHistoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: vote_histories
#
#  id         :integer         not null, primary key
#  yeas       :integer
#  nays       :integer
#  abstains   :integer
#  created_at :datetime
#  updated_at :datetime
#


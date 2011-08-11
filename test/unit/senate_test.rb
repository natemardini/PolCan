require 'test_helper'

class SenateTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: senates
#
#  id                   :integer         not null, primary key
#  seatcount            :integer
#  liberal_senators     :integer
#  tory_senators        :integer
#  independent_senators :integer
#  created_at           :datetime
#  updated_at           :datetime
#


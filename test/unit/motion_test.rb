require 'test_helper'

class MotionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: motions
#
#  id            :integer         not null, primary key
#  motion_number :integer
#  body          :text
#  confidence    :boolean
#  created_at    :datetime
#  updated_at    :datetime
#


require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: parties
#
#  id         :integer         not null, primary key
#  short_name :string(255)
#  long_name  :string(255)
#  letters    :string(255)
#  seats      :integer
#  created_at :datetime
#  updated_at :datetime
#


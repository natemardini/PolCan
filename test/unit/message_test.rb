require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  body       :text
#  special    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#


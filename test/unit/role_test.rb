require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: roles
#
#  id           :integer         not null, primary key
#  long_name    :string(255)
#  short_name   :string(255)
#  access_level :integer
#  created_at   :datetime
#  updated_at   :datetime
#


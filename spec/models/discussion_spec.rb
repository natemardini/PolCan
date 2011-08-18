require 'spec_helper'

describe Discussion do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: discussions
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  member_id  :integer
#  forum_id   :integer
#  closed     :boolean
#  created_at :datetime
#  updated_at :datetime
#


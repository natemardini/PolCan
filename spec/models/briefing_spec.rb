require 'spec_helper'

describe Briefing do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: briefings
#
#  id            :integer         not null, primary key
#  department_id :integer
#  member_id     :integer
#  body          :text
#  expiry        :datetime
#  resolved      :boolean
#  npc_name      :string(255)
#  npc_title     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#


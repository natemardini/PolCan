class Senate < ActiveRecord::Base
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


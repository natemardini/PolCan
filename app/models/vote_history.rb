class VoteHistory < ActiveRecord::Base
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


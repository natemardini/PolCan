class Bill < ActiveRecord::Base
  belongs_to :legislative_session
  has_many :provisions
  belongs_to :member
  has_one :stage
  has_many :vote_histories
end

# == Schema Information
#
# Table name: bills
#
#  id          :integer         not null, primary key
#  bill_number :integer
#  house       :integer
#  bill_type   :integer
#  long_title  :string(255)
#  short_title :string(255)
#  preamble    :text
#  created_at  :datetime
#  updated_at  :datetime
#


class ParliamentaryGroup < ActiveRecord::Base
  has_many :parties
  belongs_to :legislative_session
end

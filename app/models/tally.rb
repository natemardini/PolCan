class Tally < ActiveRecord::Base
  belongs_to :bill
  has_many :ballots
end

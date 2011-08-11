class Enactment < ActiveRecord::Base
  belongs_to :provision
  belongs_to :order
end

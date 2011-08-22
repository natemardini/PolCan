class Reading < ActiveRecord::Base
  belongs_to :member
  belongs_to :readable, :polymorphic => true
  
  validates_presence_of :member_id, :readable_id, :readable_type
  validates_uniqueness_of :member_id, :scope => [:readable_id, :readable_type]
end

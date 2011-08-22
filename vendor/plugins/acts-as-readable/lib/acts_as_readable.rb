module ActiveRecord
  module Acts
    module Readable
      def self.included(base)
        base.extend ClassMethods
      end
      
      module ClassMethods
        def acts_as_readable
          has_many :readings, :as => :readable
          has_many :members_who_read, :through => :readings, :source => :member
          
          include ActiveRecord::Acts::Readable::InstanceMethods
          extend  ActiveRecord::Acts::Readable::SingletonMethods
        end
      end
      
      module SingletonMethods
        def find_unread_by(user)
          find(:all) - find_read_by(user)
        end
        
        def find_read_by(user)
          find(:all, :conditions => ["readings.readable_id = #{table_name}.id AND readings.member_id=?", user.id], :include => :readings)
        end
      end
      
      module InstanceMethods
        def read_by!(user)
          readings << Reading.new(:member_id => user.id)
        end
        
        def unread_by!(user)
          readings.find(:first, :conditions => ["member_id = ?",user.id])
        end
        
        def read_by?(user)
          !!members_who_read.find(:first, :conditions => ["member_id = ?",user.id])
        end
      end
    end
  end
end

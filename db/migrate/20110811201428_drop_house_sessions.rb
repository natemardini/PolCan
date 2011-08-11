class DropHouseSessions < ActiveRecord::Migration
  def self.up
    drop_table :housesessions
  end

  def self.down
  end
end

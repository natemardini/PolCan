class LegislativeSessionChanges < ActiveRecord::Migration
  def self.up
    rename_table :legislative_sessions, :housesessions        
  end

  def self.down
    rename_table :housesessions, :legislative_sessions
  end
end

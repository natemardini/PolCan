class CreateLegislativeSessions < ActiveRecord::Migration
  def self.up
    create_table :legislative_sessions do |t|
      t.integer :legislature
      t.integer :session
      t.datetime :opening
      t.datetime :ending
      t.integer :seatcount
      t.boolean :dissolved

      t.timestamps
    end
  end

  def self.down
    drop_table :legislative_sessions
  end
end

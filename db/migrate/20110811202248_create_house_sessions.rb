class CreateHouseSessions < ActiveRecord::Migration
  def self.up
    create_table :house_sessions do |t|
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
    drop_table :house_sessions
  end
end

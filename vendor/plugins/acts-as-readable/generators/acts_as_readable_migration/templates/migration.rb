class ActsAsReadableMigration < ActiveRecord::Migration
  def self.up
    create_table :readings do |t|
      t.string :readable_type
      t.integer :readable_id
      t.integer :member_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :readings
  end
end

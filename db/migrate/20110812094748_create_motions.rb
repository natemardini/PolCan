class CreateMotions < ActiveRecord::Migration
  def self.up
    create_table :motions do |t|
      t.integer :motion_number
      t.text :body
      t.boolean :confidence

      t.timestamps
    end
  end

  def self.down
    drop_table :motions
  end
end

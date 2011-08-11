class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.string :short_name
      t.string :long_name
      t.string :letters
      t.integer :seats

      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end

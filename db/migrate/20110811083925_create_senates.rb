class CreateSenates < ActiveRecord::Migration
  def self.up
    create_table :senates do |t|
      t.integer :seatcount
      t.integer :liberal_senators
      t.integer :tory_senators
      t.integer :independent_senators

      t.timestamps
    end
  end

  def self.down
    drop_table :senates
  end
end

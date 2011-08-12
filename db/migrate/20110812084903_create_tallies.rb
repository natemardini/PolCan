class CreateTallies < ActiveRecord::Migration
  def self.up
    drop_table :vote_histories
    create_table :tallies do |t|
      t.integer :yeas
      t.integer :nays
      t.integer :abstains

      t.timestamps
    end
  end

  def self.down
    drop_table :tallies
  end
end

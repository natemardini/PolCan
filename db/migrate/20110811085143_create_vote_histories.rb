class CreateVoteHistories < ActiveRecord::Migration
  def self.up
    create_table :vote_histories do |t|
      t.integer :yeas
      t.integer :nays
      t.integer :abstains

      t.timestamps
    end
  end

  def self.down
    drop_table :vote_histories
  end
end

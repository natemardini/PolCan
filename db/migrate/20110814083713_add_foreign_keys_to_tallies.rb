class AddForeignKeysToTallies < ActiveRecord::Migration
  def self.up
    add_column :tallies, :bill_id, :integer
    add_column :tallies, :motion_id, :integer
  end

  def self.down
    remove_column :tallies, :motion_id
    remove_column :tallies, :bill_id
  end
end

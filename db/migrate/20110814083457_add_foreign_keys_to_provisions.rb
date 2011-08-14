class AddForeignKeysToProvisions < ActiveRecord::Migration
  def self.up
    add_column :provisions, :bill_id, :integer
  end

  def self.down
    remove_column :provisions, :bill_id
  end
end

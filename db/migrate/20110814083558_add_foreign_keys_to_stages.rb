class AddForeignKeysToStages < ActiveRecord::Migration
  def self.up
    add_column :stages, :bill_id, :integer
    add_column :stages, :motion_id, :integer
  end

  def self.down
    remove_column :stages, :motion_id
    remove_column :stages, :bill_id
  end
end

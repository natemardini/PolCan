class AddForeignKeysToHouseGroups < ActiveRecord::Migration
  def self.up
    add_column :house_groups, :house_session_id, :integer
  end

  def self.down
    remove_column :house_groups, :house_session_id
  end
end

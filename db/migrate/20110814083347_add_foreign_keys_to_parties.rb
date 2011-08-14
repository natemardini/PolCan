class AddForeignKeysToParties < ActiveRecord::Migration
  def self.up
    add_column :parties, :house_group_id, :integer
  end

  def self.down
    remove_column :parties, :house_group_id
  end
end

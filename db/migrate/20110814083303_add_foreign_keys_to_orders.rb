class AddForeignKeysToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :member_id, :integer
  end

  def self.down
    remove_column :orders, :member_id
  end
end

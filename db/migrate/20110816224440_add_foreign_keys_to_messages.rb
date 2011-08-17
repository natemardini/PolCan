class AddForeignKeysToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :bill_id, :integer
    add_column :messages, :motion_id, :integer
    add_column :messages, :house_session_id, :integer
    add_column :messages, :member_id, :integer
  end

  def self.down
    remove_column :messages, :member_id
    remove_column :messages, :house_session_id
    remove_column :messages, :motion_id
    remove_column :messages, :bill_id
  end
end

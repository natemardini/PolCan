class AddColumnToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :ancestry, :string
    add_index :messages, :ancestry
    remove_column :messages, :parent_id
  end

  def self.down
    remove_index :messages, :ancestry
    remove_column :messages, :ancestry
    add_column :messages, :parent_id, :integer
  end
end

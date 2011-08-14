class AddForeignKeysToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :member_id, :integer
    add_column :bills, :house_session_id, :integer
  end

  def self.down
    remove_column :bills, :house_session_id
    remove_column :bills, :member_id
  end
end

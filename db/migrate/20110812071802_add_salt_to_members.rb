class AddSaltToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :salt, :string
    rename_column :members, :password, :stored_password
  end

  def self.down
    remove_column :members, :salt
    rename_column :members, :stored_password, :password
  end
end

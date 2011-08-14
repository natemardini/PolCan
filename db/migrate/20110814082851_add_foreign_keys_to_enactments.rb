class AddForeignKeysToEnactments < ActiveRecord::Migration
  def self.up
    add_column :enactments, :provision_id, :integer
    add_column :enactments, :order_id, :integer
  end

  def self.down
    remove_column :enactments, :order_id
    remove_column :enactments, :provision_id
  end
end

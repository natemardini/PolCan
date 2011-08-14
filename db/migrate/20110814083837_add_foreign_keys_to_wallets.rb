class AddForeignKeysToWallets < ActiveRecord::Migration
  def self.up
    add_column :wallets, :member_id, :integer
    add_column :wallets, :party_id, :integer
  end

  def self.down
    remove_column :wallets, :party_id
    remove_column :wallets, :member_id
  end
end

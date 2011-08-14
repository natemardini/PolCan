class AddForeignKeysToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :wallet_id, :integer
  end

  def self.down
    remove_column :transactions, :wallet_id
  end
end

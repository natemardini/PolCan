class AddFieldToWallets < ActiveRecord::Migration
  def change
    add_column :wallets, :clout, :integer
  end
end

class CreateWallets < ActiveRecord::Migration
  def self.up
    create_table :wallets do |t|
      t.integer :popularity
      t.decimal :cash

      t.timestamps
    end
  end

  def self.down
    drop_table :wallets
  end
end

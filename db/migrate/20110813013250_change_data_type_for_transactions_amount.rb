class ChangeDataTypeForTransactionsAmount < ActiveRecord::Migration
  def self.up
    change_table :transactions do |t|
      t.change :amount, :decimal
    end
  end

  def self.down
    change_table :transactions do |t|
      t.change :amount, :integer
    end
  end
end

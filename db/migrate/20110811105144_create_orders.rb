class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :style
      t.text :text
      t.datetime :enacting_date

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end

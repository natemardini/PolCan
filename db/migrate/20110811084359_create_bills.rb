class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.integer :bill_number
      t.integer :house
      t.integer :bill_type
      t.string :long_title
      t.string :short_title
      t.text :preamble

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end

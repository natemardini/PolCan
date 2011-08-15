class DropTableEnactments < ActiveRecord::Migration
  def self.up
    drop_table :enactments
  end

  def self.down
    create_table :enactments do |t|
      t.integer :enactment_type
      t.datetime :enacting_day
      t.integer :provision_id
      t.integer :order_id
    end
  end
end

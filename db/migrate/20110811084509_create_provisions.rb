class CreateProvisions < ActiveRecord::Migration
  def self.up
    create_table :provisions do |t|
      t.integer :article
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :provisions
  end
end

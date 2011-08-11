class CreateEnactments < ActiveRecord::Migration
  def self.up
    create_table :enactments do |t|
      t.integer :enactment_type
      t.datetime :enacting_date

      t.timestamps
    end
  end

  def self.down
    drop_table :enactments
  end
end

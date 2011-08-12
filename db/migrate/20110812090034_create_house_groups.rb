class CreateHouseGroups < ActiveRecord::Migration
  def self.up
    drop_table :parliamentary_groups
    create_table :house_groups do |t|
      t.integer :side
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :house_groups
  end
end

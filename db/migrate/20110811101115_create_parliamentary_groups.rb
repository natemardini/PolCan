class CreateParliamentaryGroups < ActiveRecord::Migration
  def self.up
    create_table :parliamentary_groups do |t|
      t.string :side
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :parliamentary_groups
  end
end

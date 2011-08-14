class CreateRidings < ActiveRecord::Migration
  def self.up
    create_table :ridings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ridings
  end
end

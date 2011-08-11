class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :long_name
      t.string :short_name
      t.integer :access_level

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end

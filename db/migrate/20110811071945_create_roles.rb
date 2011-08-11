class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :short_title
      t.string :long_title
      t.integer :access_level

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end

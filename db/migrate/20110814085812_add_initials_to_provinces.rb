class AddInitialsToProvinces < ActiveRecord::Migration
  def self.up
    add_column :provinces, :letters, :string
  end

  def self.down
    remove_column :provinces, :letters
  end
end

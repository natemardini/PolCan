class AddProvinceIdToRidings < ActiveRecord::Migration
  def self.up
    add_column :ridings, :province_id, :integer
  end

  def self.down
    remove_column :ridings, :province_id
  end
end

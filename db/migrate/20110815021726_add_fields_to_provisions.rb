class AddFieldsToProvisions < ActiveRecord::Migration
  def self.up
    add_column :provisions, :effect_date, :datetime
    add_column :provisions, :order_id, :integer
  end

  def self.down
    remove_column :provisions, :order_id
    remove_column :provisions, :effect_date
  end
end

class AddEffectivenessToProvision < ActiveRecord::Migration
  def self.up
    add_column :provisions, :in_effect, :integer
  end

  def self.down
    remove_column :provisions, :in_effect
  end
end

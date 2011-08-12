class AddReadingToTallies < ActiveRecord::Migration
  def self.up
    add_column :tallies, :reading, :integer
  end

  def self.down
    remove_column :tallies, :reading
  end
end

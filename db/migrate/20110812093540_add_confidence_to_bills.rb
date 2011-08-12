class AddConfidenceToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :confidence, :boolean
  end

  def self.down
    remove_column :bills, :confidence
  end
end

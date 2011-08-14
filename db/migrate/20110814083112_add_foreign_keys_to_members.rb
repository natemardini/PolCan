class AddForeignKeysToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :party_id, :integer
  end

  def self.down
    remove_column :members, :party_id
  end
end

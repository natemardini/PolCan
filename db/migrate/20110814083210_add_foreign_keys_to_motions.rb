class AddForeignKeysToMotions < ActiveRecord::Migration
  def self.up
    add_column :motions, :member_id, :integer
    add_column :motions, :house_session_id, :integer
  end

  def self.down
    remove_column :motions, :house_session_id
    remove_column :motions, :member_id
  end
end

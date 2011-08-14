class AddMemberIdToRidings < ActiveRecord::Migration
  def self.up
    add_column :ridings, :member_id, :integer
  end

  def self.down
    remove_column :ridings, :member_id
  end
end

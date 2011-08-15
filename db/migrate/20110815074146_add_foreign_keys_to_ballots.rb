class AddForeignKeysToBallots < ActiveRecord::Migration
  def self.up
    add_column :ballots, :member_id, :integer
    add_column :ballots, :tally_id, :integer
    add_column :ballots, :stage_id, :integer
  end

  def self.down
    remove_column :ballots, :stage_id
    remove_column :ballots, :tally_id
    remove_column :ballots, :member_id
  end
end

class AddColumnsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :discussion_id, :integer
    add_column :messages, :destination, :integer
  end
end

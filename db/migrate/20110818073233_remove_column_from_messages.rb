class RemoveColumnFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :party_id
  end
end

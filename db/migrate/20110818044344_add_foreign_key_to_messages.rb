class AddForeignKeyToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :party_id, :integer
  end
end

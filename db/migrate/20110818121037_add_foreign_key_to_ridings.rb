class AddForeignKeyToRidings < ActiveRecord::Migration
  def change
    add_column :ridings, :party_id, :integer
  end
end

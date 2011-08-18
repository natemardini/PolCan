class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :party_id
      t.integer :motion_id
      t.integer :bill_id
      t.integer :house_session_id
      t.integer :house_group_id

      t.timestamps
    end
  end
end

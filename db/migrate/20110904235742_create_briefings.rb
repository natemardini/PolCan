class CreateBriefings < ActiveRecord::Migration
  def change
    create_table :briefings do |t|
      t.integer :department_id
      t.integer :member_id
      t.text :body
      t.datetime :expiry
      t.boolean :resolved
      t.string :npc_name
      t.string :npc_title

      t.timestamps
    end
  end
end

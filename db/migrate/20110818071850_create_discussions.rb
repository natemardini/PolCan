class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :subject
      t.integer :member_id
      t.integer :forum_id
      t.boolean :closed

      t.timestamps
    end
    
    remove_column :messages, :bill_id
    remove_column :messages, :motion_id
    remove_column :messages, :house_session_id
    remove_column :messages, :subject
    remove_column :messages, :special
    remove_column :messages, :ancestry
  end
end

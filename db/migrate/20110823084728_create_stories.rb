class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :subject
      t.text :body
      t.integer :category
      t.integer :member_id

      t.timestamps
    end
  end
end

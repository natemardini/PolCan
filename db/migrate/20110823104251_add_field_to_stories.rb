class AddFieldToStories < ActiveRecord::Migration
  def change
    add_column :stories, :newspic, :string
  end
end

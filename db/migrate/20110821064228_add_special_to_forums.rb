class AddSpecialToForums < ActiveRecord::Migration
  def change
    add_column :forums, :special, :integer
  end
end

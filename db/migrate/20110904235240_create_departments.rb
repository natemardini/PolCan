class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.decimal :treasury
      t.integer :member_id

      t.timestamps
    end
  end
end

class AddDepartmentToOralQuestions < ActiveRecord::Migration
  def change
    add_column :oral_questions, :department, :string
  end
end

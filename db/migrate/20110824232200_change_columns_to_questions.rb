class ChangeColumnsToQuestions < ActiveRecord::Migration
  def change
    rename_column :oral_questions, :questioner, :questioner_id
    rename_column :oral_questions, :answerer, :answerer_id
  end
end

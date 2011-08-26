class AddFKToOralQuestions < ActiveRecord::Migration
  def change
    add_column :oral_questions, :house_session_id, :integer
  end
end

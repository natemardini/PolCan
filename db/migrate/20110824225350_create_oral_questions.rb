class CreateOralQuestions < ActiveRecord::Migration
  def change
    create_table :oral_questions do |t|
      t.text :question
      t.text :answer
      t.integer :questioner
      t.integer :answerer
      t.datetime :timelimit

      t.timestamps
    end
  end
end

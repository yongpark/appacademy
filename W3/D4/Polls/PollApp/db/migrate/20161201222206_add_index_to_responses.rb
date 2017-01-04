class AddIndexToResponses < ActiveRecord::Migration
  def change
    add_index :responses, :answer_choice_id
    add_index :responses, :question_id
  end
end

class ForeignKeyForResponses < ActiveRecord::Migration
  def change
    add_column :responses, :respondent_id, :integer, null: false
    remove_column :responses, :question_id
    add_column :answer_choices, :question_id, :integer, null: false

    add_column :questions, :polls_id, :integer, null: false
  end
end

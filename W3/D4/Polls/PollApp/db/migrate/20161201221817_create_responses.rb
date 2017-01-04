class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id, null: false
      t.integer :answer_choice_id, null: false
      t.timestamps null: false
      # add_index :answer_choice_id, :question_id
    end
  end
end

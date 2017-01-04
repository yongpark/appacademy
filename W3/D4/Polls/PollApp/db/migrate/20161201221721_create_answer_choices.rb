class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.string :answer, null: false
      t.timestamps null: false
    end
  end
end

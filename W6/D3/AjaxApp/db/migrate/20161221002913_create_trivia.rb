class CreateTrivia < ActiveRecord::Migration[5.0]
  def change
    create_table :trivia do |t|
      t.string :fact

      t.timestamps
    end
  end
end

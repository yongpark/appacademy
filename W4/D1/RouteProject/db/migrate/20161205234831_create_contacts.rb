class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|

      t.string :name, :null => false
      t.string :email, :null => false
      t.string :user_id, :null => false
    end
    add_index :users, :username, :unique => true
    add_index :contacts, :user_id
    add_index :contacts, :email, :unique => true
  end
end

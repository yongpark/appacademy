class EditContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contacts, :user_id

    add_column :contacts, :user_id, :integer, :null => false, :unique => true
  end
end

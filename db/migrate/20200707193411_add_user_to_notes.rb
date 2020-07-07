class AddUserToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :user, foreign_key: true
    change_column_null :notes, :user_id, false
  end
end

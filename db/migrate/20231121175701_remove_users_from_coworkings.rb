class RemoveUsersFromCoworkings < ActiveRecord::Migration[7.1]
  def change
    remove_reference :coworkings, :users, null: false, foreign_key: true
  end
end

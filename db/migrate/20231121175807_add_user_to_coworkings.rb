class AddUserToCoworkings < ActiveRecord::Migration[7.1]
  def change
    add_reference :coworkings, :user, null: false, foreign_key: true
  end
end

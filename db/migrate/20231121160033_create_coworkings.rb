class CreateCoworkings < ActiveRecord::Migration[7.1]
  def change
    create_table :coworkings do |t|
      t.string :title
      t.string :address
      t.float :price
      t.text :description
      t.string :image
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRents < ActiveRecord::Migration[7.1]
  def change
    create_table :rents do |t|
      t.date :start_date
      t.date :end_date
      t.references :coworking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

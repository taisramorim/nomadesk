class AddStatusToRents < ActiveRecord::Migration[7.1]
  def change
    add_column :rents, :status, :integer
  end
end

class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|

      t.timestamps
    end
  end
end

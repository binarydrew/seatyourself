class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :address
      t.string :name
      t.string :price_range
      t.references :cuisine, index: true
      t.integer :capacity
      t.integer :opening_time
      t.integer :closing_time

      t.timestamps
    end
  end
end

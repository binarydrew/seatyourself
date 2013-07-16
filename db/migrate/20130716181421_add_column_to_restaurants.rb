class AddColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :neighbourhood, :string
  end
end

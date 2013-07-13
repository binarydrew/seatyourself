class RemoveDateToReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :date, :string
  end
end

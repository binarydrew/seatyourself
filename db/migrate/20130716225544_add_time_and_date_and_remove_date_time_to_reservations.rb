class AddTimeAndDateAndRemoveDateTimeToReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :datetime
    add_column :reservations, :time, :time
    add_column :reservations, :date, :date
  end
end

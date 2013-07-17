class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.time :time
      t.date :date
      t.integer :seats
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end

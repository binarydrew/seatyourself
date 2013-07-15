class ChangeTimeToDateInRevervation < ActiveRecord::Migration
  def self.up
    change_column :reservations, :time, :datetime
  end

  def self.down
    change_column :reservations, :time, :time
  end
end

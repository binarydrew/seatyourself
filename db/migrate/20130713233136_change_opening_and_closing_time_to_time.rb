class ChangeOpeningAndClosingTimeToTime < ActiveRecord::Migration
  def self.up
    change_column :restaurants, :opening_time, :time
    change_column :restaurants, :closing_time, :time
  end

  def self.down
    change_column :restaurants, :opening_time, :string
    change_column :restaurants, :closing_time, :string
  end
end

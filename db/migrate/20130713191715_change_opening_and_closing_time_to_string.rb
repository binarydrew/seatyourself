class ChangeOpeningAndClosingTimeToString < ActiveRecord::Migration
  def self.up
    change_column :restaurants, :opening_time, :string
    change_column :restaurants, :closing_time, :string
  end

  def self.down
    change_column :restaurants, :opening_time, :integer
    change_column :restaurants, :closing_time, :integer
  end
end

class Restaurant < ActiveRecord::Base

  require 'tod'

  belongs_to :cuisine
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews
  has_many :timeslots


  def parse_time(hour, minute)
    TimeOfDay.new(hour.to_i,minute.to_i).strftime("%H:%M")
  end

  def unparse_time(time)
    time = TimeOfDay.parse time
    time.on Date.new
  end




end

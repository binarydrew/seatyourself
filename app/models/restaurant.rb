class Restaurant < ActiveRecord::Base

  require 'tod'

  belongs_to :cuisine
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews
  has_many :timeslots


  def parse_time(hour)
    TimeOfDay.new(hour).strftime("%H:%M")
  end

  def unparse_time(time)
    time = TimeOfDay.parse time
    time.on Date.new
  end

  def show_available_seats(timeslot)
    seats = self.timeslots.where(restaurant_id: self.id, date: timeslot.date, time:timeslot.time)
    self.capacity - seats.first.seats
  end

end

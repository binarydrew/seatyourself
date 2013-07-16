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

  def show_available_seats
    seats = self.timeslots.where()
    Restaurant.first.timeslots.where(date: "2013-07-16", time: 21)

    self.capacity - seats
  end

end

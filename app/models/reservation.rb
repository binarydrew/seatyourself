class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  after_save :create_timeslot

  def create_timeslot
    timeslot = self.restaurant.timeslots.build
    timeslot.time = self.datetime.time
    timeslot.date = self.datetime.to_date
    timeslot.seats = self.guests
    timeslot.save
  end

end

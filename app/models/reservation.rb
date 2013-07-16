class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  after_create :create_timeslot, if:

  def create_timeslot
    timeslot = self.restaurant.timeslots.build # timeslots.new
    timeslot.time = self.datetime.hour
    timeslot.date = self.datetime.to_date
    timeslot.seats = self.guests
    timeslot.save
  end

end

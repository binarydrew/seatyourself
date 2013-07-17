class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  after_create :check_timeslot_exists


  def create_timeslot
    timeslot = self.restaurant.timeslots.build # timeslots.new
    timeslot.time = self.time.hour
    timeslot.date = self.date.to_date
    timeslot.seats = self.guests
    timeslot.save
  end

  def check_timeslot_exists
    timeslot = self.restaurant.timeslots.where(time: self.time.hour, date: self.date.to_date)
    if timeslot.empty?
      create_timeslot
    else
      timeslot.first.seats += self.guests
      timeslot.first.save
    end
  end

end

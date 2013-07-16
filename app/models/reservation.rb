class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  after_create :check_timeslot_exists


  def create_timeslot
    timeslot = self.restaurant.timeslots.build # timeslots.new
    timeslot.time = self.datetime.hour
    timeslot.date = self.datetime.to_date
    timeslot.seats = self.guests
    timeslot.save
  end

  def check_timeslot_exists
    timeslot = self.restaurant.timeslots.where(time: self.datetime.hour, date: self.datetime.to_date)
    if timeslot.empty?
      create_timeslot
    else
      timeslot.first.seats += self.guests
      timeslot.first.save
    end
  end

end

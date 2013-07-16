class Restaurant < ActiveRecord::Base

  require 'tod'

  belongs_to :cuisine
  has_many :reservations
  has_many :users, through: :reservations
<<<<<<< HEAD
  has_many :reviews
  has_many :timeslots
=======
  has_many :reviews 
>>>>>>> cc2c9ca520d9516f0daf2ee76152f8c1fa720848


  def parse_time(hour)
    TimeOfDay.new(hour).strftime("%H:%M")
  end

  def unparse_time(time)
    time = TimeOfDay.parse time
    time.on Date.new
<<<<<<< HEAD
  end


=======
  end  
>>>>>>> cc2c9ca520d9516f0daf2ee76152f8c1fa720848


end

class Restaurant < ActiveRecord::Base

  require 'tod'

  belongs_to :cuisine
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews 


  def parse_time(hour)
    TimeOfDay.new(hour).strftime("%H:%M")
  end

  def unparse_time(time)
    time = TimeOfDay.parse time
    time.on Date.new
  end  


end

class Restaurant < ActiveRecord::Base
  belongs_to :cuisine
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews


  def parsed_time(hour, minute)
    hour + ":" + minute
  end


end

class User < ActiveRecord::Base
  has_many :reservations
  has_many :reviews
  has_many :restaurants, through: :reservations

end

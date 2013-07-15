class User < ActiveRecord::Base
  has_many :reservations
  has_many :reviews
  has_many :restaurants, through: :reservations
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_length_of :password, minimum: 6, too_short: 'Please enter a password with at least 6 characters' 
  validates :first_name, presence: true
  validates :last_name, presence: true



end

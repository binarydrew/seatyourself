# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Cuisines
Cuisine.create(name: "Chinese")
Cuisine.create(name: "British")
Cuisine.create(name: "Italian")
Cuisine.create(name: "Greek")

# Restaurants
Restaurant.create(address: "20 King St", name: "The Chinaman", price_range: "Low", cuisine_id: 1, capacity: 30, opening_time: "12:00", closing_time: "00:00")
Restaurant.create(address: "20 Queen St", name: "The Italian", price_range: "Medium", cuisine_id: 3, capacity: 60, opening_time: "12:00", closing_time: "23:00")

# Users
User.create(first_name: "James", last_name: "Cook", email: "jamesmarkcook@gmail.com", password: "password", password_confirmation: "password")
User.create(first_name: "Ben", last_name: "Liang", email: "benmliang@gmail.com", password: "password", password_confirmation: "password")

# Reservations

Reservation.create(user_id: 1, restaurant_id: 1, time: "2013-07-14 20:00:00", duration: 2, guests: 5)
Reservation.create(user_id: 1, restaurant_id: 1, time: "2013-07-14 21:00:00", duration: 2, guests: 2)

# Reviews

Review.create(content: "It was amazing!", rating: 5, user_id: 1, restaurant_id: 1)
Review.create(content: "It was awful!", rating: 1, user_id: 2, restaurant_id: 3)

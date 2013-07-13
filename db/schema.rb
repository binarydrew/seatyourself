# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130713233136) do

  create_table "cuisines", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.time     "time"
    t.integer  "duration"
    t.integer  "guests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["restaurant_id"], name: "index_reservations_on_restaurant_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "restaurants", force: true do |t|
    t.string   "address"
    t.string   "name"
    t.string   "price_range"
    t.integer  "cuisine_id"
    t.integer  "capacity"
    t.time     "opening_time", limit: 255
    t.time     "closing_time", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["cuisine_id"], name: "index_restaurants_on_cuisine_id"

  create_table "reviews", force: true do |t|
    t.string   "content"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    user_id 1
    restaurant_id 1
    datetime "2013-07-12 16:29:25"
    duration 1
    guests 10
  end
end

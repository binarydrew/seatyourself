# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timeslot do
    time "2013-07-16 15:58:47"
    date "2013-07-16"
    seats 1
    restaurant nil
  end
end

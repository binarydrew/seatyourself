# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    address "Chinatown"
    name "2 Wongs Don't Make a White"
    price_range "Low"
    cuisine_id 1
    capacity 40
    opening_time 9
    closing_time 23
    neighbourhood "Chinatown"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    address "MyString"
    name "MyString"
    price_range "MyString"
    cuisine nil
    capacity 1
    opening_time 1
    closing_time 1
  end
end

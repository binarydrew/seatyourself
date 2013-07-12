# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    content "MyString"
    rating 1
    user nil
    restaurant nil
  end
end

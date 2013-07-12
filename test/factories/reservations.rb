# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    user nil
    restaurant nil
    time "2013-07-12 16:29:25"
    duration 1
    date "2013-07-12"
    guests 1
  end
end

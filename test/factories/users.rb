# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Hao Jun"
    last_name "Liang"
    email "benmliang@gmail.com"
    password "password"
    password_confirmation "password"
  end

end

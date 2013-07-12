# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Hao Jun"
    last_name "Liang"
    email "benmliang@gmail.com"
    password_digest "password"
  end

  factory :user2 do
    first_name "James"
    last_name "Cook"
    email "jamesmarkcook@gmail.com"
    password_digest "password"
  end

  factory :user3 do
    first_name "Andrew"
    last_name "Li"
    email "typicalchinesename@gmail.com"
    password_digest "chingchangchong"
  end

end

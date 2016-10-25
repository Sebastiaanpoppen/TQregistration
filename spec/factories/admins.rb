FactoryGirl.define do
  factory :admin do

    password           { Faker::Internet.password }
    email              { Faker::Internet.email }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end

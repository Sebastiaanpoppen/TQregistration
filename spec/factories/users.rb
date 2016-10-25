FactoryGirl.define do
  factory :user do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.last_name }
    company           { Faker::Company.name }
    email             { Faker::Internet.email }
    newsletter        true

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end

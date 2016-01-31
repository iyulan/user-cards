FactoryGirl.define do
  factory :card do
    sequence(:first_name) { Faker::Name.first_name }
    sequence(:last_name) { Faker::Name.last_name }
    sequence(:gender) { rand(2) }
  end
end

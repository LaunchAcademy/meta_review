FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jon#{n}@doe.com" }
    sequence(:username) { |n| "jon#{n}doe" }
    password "password123"
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jon#{n}@doe.com" }
    password 'password123'
  end
end

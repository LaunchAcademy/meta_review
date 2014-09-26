FactoryGirl.define do
  factory :site do
    association :user

    sequence(:title) { |n| "Goo#{n}gle!" }
    sequence(:url) { |n| "http://google#{n}.com" }
    description "If you need to find reviews go here"
  end
end

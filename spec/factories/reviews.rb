FactoryGirl.define do
  factory :review do
    association :user
    association :site

    rating "4"
    body "If you need to find reviews go here"
  end
end

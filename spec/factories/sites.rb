FactoryGirl.define do
  factory :site do
    association :user

    title "Google!"
    url "http://google.com"
    description "If you need to find reviews go here"
  end
end

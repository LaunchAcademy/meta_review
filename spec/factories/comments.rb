FactoryGirl.define do
  factory :comment do
    association :user
    association :review

    body "Great review"
  end
end

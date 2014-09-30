class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates
    :value, presence: true, inclusion: { in: [1, 0, -1] }
end

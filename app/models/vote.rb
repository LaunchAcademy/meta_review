class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :value, presence: true, inclusion: { in: [1, 0, -1] }
end

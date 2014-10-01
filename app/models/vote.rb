class Vote < ActiveRecord::Base
  belongs_to :user, presence: true
  belongs_to :review, presence: true

  validates :value, presence: true, inclusion: { in: [1, 0, -1] }
end

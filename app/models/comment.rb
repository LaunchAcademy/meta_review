class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :body, presence: true
  validates :user, presence: true
  validates :review, presence: true
end

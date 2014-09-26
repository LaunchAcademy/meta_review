class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :body, :user_id, :review_id, presence: true
end

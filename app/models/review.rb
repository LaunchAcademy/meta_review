class Review < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  has_many :comments

  validates :rating, :user_id, :site_id, presence: true
end

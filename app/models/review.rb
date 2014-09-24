class Review < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

  validates :site, presence: true
  validates :user, presence: true

  validates :user_id, uniqueness: { scope: :site_id }
end

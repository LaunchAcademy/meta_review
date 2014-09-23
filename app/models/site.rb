class Site < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :title, :url, :description, :user_id, presence: true
end

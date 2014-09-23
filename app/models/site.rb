class Site < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :title, uniqueness: true
  validates :url, uniqueness: true
  validates :title, :url, :description, :user_id, presence: true
end

class Site < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :comments, through: :reviews

  validates :title, uniqueness: true
  validates :url, uniqueness: true
  validates :title, :url, :description, :user_id, presence: true

  def self.search(search)
    if search
      where("title ILIKE ?", "%#{search}%")
    else
      all
    end
  end
end

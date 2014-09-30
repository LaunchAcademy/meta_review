class Site < ActiveRecord::Base
  paginates_per 5
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :comments, through: :reviews

  validates :title, uniqueness: true
  validates :url, uniqueness: true
  validates :title, :url, :description, :user_id, presence: true


  def self.search(search)
    if search
      where("title ILIKE?", "%#{search}%")
    else
      all
    end
  def formatted_url
    url =~ /\Ahttp:\/\// ? url : "http://#{url}"
  end
end

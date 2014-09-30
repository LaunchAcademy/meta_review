class Site < ActiveRecord::Base
  paginates_per 5
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :comments, through: :reviews

  validates :title, uniqueness: true
  validates :url, uniqueness: true
  validates :title, :url, :description, :user_id, presence: true

  def self.search
    if search
      where("title ILIKE ?", "%#{search}%")
    else

     @sites = all.order(:title).page params[:page]
    end
  end
end

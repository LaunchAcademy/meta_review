class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :sites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :votes
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

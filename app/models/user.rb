class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :sites

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  has_many :sites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

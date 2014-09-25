class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :sites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def admin?
    if self.admin == true
      return true
    else
      return false
    end
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end

class User < ActiveRecord::Base
  has_many :sites

  def is_admin?
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

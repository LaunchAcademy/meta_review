class Site < ActiveRecord::Base
  belongs_to :user

  validates :title, uniqueness: true
  validates :url, uniqueness: true
  validates :title, :url, :description, :user_id, presence: true

     validates :title, presence: true # indent fail

  def hellow
    'foo' + "bar"
  end
end

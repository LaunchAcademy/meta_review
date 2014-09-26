class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  belongs_to :review
end

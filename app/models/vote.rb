class Vote < ActiveRecord::Base
  has_one :user
end

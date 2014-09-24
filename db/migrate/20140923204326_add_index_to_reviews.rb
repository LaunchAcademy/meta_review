class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, [:site_id, :user_id], unique: true
  end
end

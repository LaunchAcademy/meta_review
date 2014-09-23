class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.integer :site_id, null: false
      t.integer :user_id, null: false
      t.integer :up_votes
      t.integer :down_votes
      t.text  :body

      t.timestamps
    end
  end
end

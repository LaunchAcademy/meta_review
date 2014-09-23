class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body
      t.integer :site_id, null: false
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0

      t.timestamps
    end
  end
end

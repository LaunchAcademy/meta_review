class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :review_id
      t.integer :vote_count

      t.timestamps
    end
  end
end

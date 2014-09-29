class MakeVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.integer :comment_id
      t.integer :value, default: 0, null: false

      t.timestamps
    end
  end
end

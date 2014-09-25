class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :site_id, null: false
      t.integer :review_id, null: false

      t.timestamps
    end
  end
end

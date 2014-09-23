class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :description, null: false
      t.string :screenshot
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

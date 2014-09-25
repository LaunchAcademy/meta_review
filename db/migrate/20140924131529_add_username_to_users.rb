class AddUsernameToUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, uniqueness: true, null: false
    end
  end
end

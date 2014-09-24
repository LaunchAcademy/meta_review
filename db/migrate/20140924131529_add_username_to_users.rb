class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, uniqueness: true, null: false
  end
end

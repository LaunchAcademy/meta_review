class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
       t.string "email", default: "", null: false
       t.string "encrypted_password", default: "", null: false
       t.string "reset_password_token"
       t.datetime "reset_password_sent_at"
       t.datetime "remember_created_at"
       t.integer "sign_in_count", default: 0, null: false
       t.datetime "current_sign_in_at"
       t.datetime "last_sign_in_at"
       t.inet "current_sign_in_ip"
       t.inet "last_sign_in_ip"
       t.datetime "created_at"
       t.datetime "updated_at"
       t.string "username", null: false
    end
    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end
end

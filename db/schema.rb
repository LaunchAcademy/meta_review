ActiveRecord::Schema.define(version: 20140925181153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: true do |t|
    t.integer  "rating",     null: false
    t.integer  "site_id",    null: false
    t.integer  "user_id",    null: false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["site_id", "user_id"], name: "index_reviews_on_site_id_and_user_id", unique: true, using: :btree

  create_table "sites", force: true do |t|
    t.string   "title",       null: false
    t.string   "url",         null: false
    t.text     "description", null: false
    t.string   "screenshot"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id",                null: false
    t.integer  "review_id",              null: false
    t.integer  "comment_id"
    t.integer  "value",      default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 5) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "client_id"
    t.string   "token",                          null: false
    t.string   "refresh_token"
    t.string   "scopes",            default: ""
    t.datetime "expires_at"
    t.datetime "revoked_at"
    t.datetime "created_at",                     null: false
    t.index ["client_id"], name: "index_access_tokens_on_client_id", using: :btree
    t.index ["refresh_token"], name: "index_access_tokens_on_refresh_token", unique: true, using: :btree
    t.index ["resource_owner_id"], name: "index_access_tokens_on_resource_owner_id", using: :btree
    t.index ["token"], name: "index_access_tokens_on_token", unique: true, using: :btree
  end

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_applications_on_key", unique: true, using: :btree
  end

  create_table "following", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id", "follower_id"], name: "index_following_on_followed_id_and_follower_id", unique: true, using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

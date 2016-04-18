# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160418103248) do

  create_table "favorites", force: :cascade do |t|
    t.integer  "favuser_id"
    t.integer  "favpost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["favpost_id"], name: "index_favorites_on_favpost_id"
  add_index "favorites", ["favuser_id", "favpost_id"], name: "index_favorites_on_favuser_id_and_favpost_id", unique: true
  add_index "favorites", ["favuser_id"], name: "index_favorites_on_favuser_id"

  create_table "microposts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "retweets", force: :cascade do |t|
    t.integer  "retweetuser_id"
    t.integer  "retweetpost_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "retweets", ["retweetpost_id"], name: "index_retweets_on_retweetpost_id"
  add_index "retweets", ["retweetuser_id", "retweetpost_id"], name: "index_retweets_on_retweetuser_id_and_retweetpost_id", unique: true
  add_index "retweets", ["retweetuser_id"], name: "index_retweets_on_retweetuser_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "profile"
    t.string   "area"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

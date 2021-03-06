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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110419060702) do

  create_table "favoritetweets", :force => true do |t|
    t.integer  "tweet_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followslists", :force => true do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followsusers", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "following_id"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followsusers", ["follower_id", "following_id"], :name => "index_followsusers_on_follower_id_and_following_id", :unique => true
  add_index "followsusers", ["follower_id"], :name => "index_followsusers_on_follower_id"
  add_index "followsusers", ["following_id"], :name => "index_followsusers_on_following_id"

  create_table "inlists", :force => true do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.boolean  "private",    :default => false
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messagerelations", :force => true do |t|
    t.integer  "message_id"
    t.integer  "from_id"
    t.integer  "to_id"
    t.boolean  "read",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject",    :null => false
    t.text     "body",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tagmentions", :force => true do |t|
    t.integer  "tweet_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.integer  "privacy"
    t.string   "webpage"
    t.string   "time_zone"
    t.text     "bio"
    t.string   "location"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

end

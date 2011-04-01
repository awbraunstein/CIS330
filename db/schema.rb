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

ActiveRecord::Schema.define(:version => 20110318035821) do

  create_table "follows_user", :id => false, :force => true do |t|
    t.integer "follower_id"
    t.integer "follows_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject",    :null => false
    t.text     "body",       :null => false
    t.integer  "from_id",    :null => false
    t.integer  "to_id",      :null => false
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

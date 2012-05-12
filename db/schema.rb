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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120512135326) do

  create_table "bars", :force => true do |t|
    t.string   "shop_id"
    t.text     "json"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "going_bars", :force => true do |t|
    t.integer  "user_id"
    t.integer  "bar_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "going_bars", ["bar_id"], :name => "index_going_bars_on_bar_id"
  add_index "going_bars", ["user_id"], :name => "index_going_bars_on_user_id"

  create_table "sessions", :force => true do |t|
    t.integer  "user_id"
    t.string   "key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topiccings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "topiccings", ["topic_id"], :name => "index_topiccings_on_topic_id"
  add_index "topiccings", ["user_id"], :name => "index_topiccings_on_user_id"

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nickname"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
    t.string   "hashed_password"
    t.integer  "sex"
    t.integer  "age"
    t.integer  "pref_code"
  end

end

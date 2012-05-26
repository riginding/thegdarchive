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

ActiveRecord::Schema.define(:version => 20120526131114) do

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.integer  "game_id"
    t.integer  "show_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "timestamps", :force => true do |t|
    t.string   "content"
    t.integer  "timeat"
    t.integer  "vod_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "timestamps", ["vod_id"], :name => "index_timestamps_on_vod_id"

  create_table "vods", :force => true do |t|
    t.string   "title"
    t.integer  "clip_id"
    t.boolean  "accessible"
    t.integer  "length"
    t.integer  "game_id"
    t.integer  "show_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vods", ["game_id"], :name => "index_vods_on_game_id"
  add_index "vods", ["show_id"], :name => "index_vods_on_show_id"

end

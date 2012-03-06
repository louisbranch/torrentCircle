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

ActiveRecord::Schema.define(:version => 20120217141823) do

  create_table "daily_updates", :force => true do |t|
    t.text     "positions"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.integer  "rating"
    t.string   "url"
    t.string   "poster_url"
    t.text     "plot"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "release_formats", :force => true do |t|
    t.string   "name"
    t.text     "labels"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "torrents", :force => true do |t|
    t.string   "pid"
    t.string   "name"
    t.string   "url"
    t.text     "magnet"
    t.integer  "downloads_count",   :default => 0
    t.integer  "movie_id"
    t.integer  "release_format_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "torrents", ["movie_id"], :name => "index_torrents_on_movie_id"
  add_index "torrents", ["pid"], :name => "index_torrents_on_pid"
  add_index "torrents", ["release_format_id"], :name => "index_torrents_on_release_format_id"

end

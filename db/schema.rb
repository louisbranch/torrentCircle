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

ActiveRecord::Schema.define(:version => 20120215025630) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.integer  "rating"
    t.string   "url"
    t.string   "image"
    t.text     "plot"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "torrents", :force => true do |t|
    t.string   "pid"
    t.string   "name"
    t.string   "url"
    t.string   "tracker"
    t.string   "magnet"
    t.integer  "downloads_count", :default => 0
    t.integer  "movie_id"
    t.integer  "format_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "torrents", ["format_id"], :name => "index_torrents_on_format_id"
  add_index "torrents", ["movie_id"], :name => "index_torrents_on_movie_id"
  add_index "torrents", ["pid"], :name => "index_torrents_on_pid"

end

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

ActiveRecord::Schema.define(:version => 20111113035803) do

  create_table "categories", :force => true do |t|
    t.string   "category",   :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "country",    :limit => 75, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_ideas", :force => true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "idea",                                :null => false
    t.string   "short_description",                   :null => false
    t.text     "long_description"
    t.boolean  "active",            :default => true
    t.boolean  "public",            :default => true
    t.integer  "weight",            :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "title",      :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tag_ideas", :force => true do |t|
    t.integer  "idea_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_ideas", :force => true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.integer  "weight",     :default => 0
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "country_id"
    t.integer  "job_id"
    t.string   "name",                        :null => false
    t.string   "lastname",                    :null => false
    t.datetime "birthday"
    t.boolean  "sex"
    t.string   "email"
    t.text     "bio"
    t.integer  "fb_id",       :default => 0
    t.string   "timezone",    :default => ""
    t.string   "fb_username", :default => ""
    t.string   "fb_link",     :default => ""
    t.integer  "weight",      :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
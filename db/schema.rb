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

ActiveRecord::Schema.define(:version => 20120711193648) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "status"
    t.string   "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "events", ["name"], :name => "index_events_on_name", :unique => true

  create_table "narratives", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "content"
    t.string   "image_link"
  end

  add_index "narratives", ["content"], :name => "index_narratives_on_content"
  add_index "narratives", ["event_id", "created_at"], :name => "index_narratives_on_event_id_and_created_at"
  add_index "narratives", ["user_id", "created_at"], :name => "index_narratives_on_user_id_and_created_at"

  create_table "recommendations", :force => true do |t|
    t.string   "snippet"
    t.integer  "user_id"
    t.integer  "narrative_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "recommendations", ["narrative_id", "created_at"], :name => "index_recommendations_on_narrative_id_and_created_at"
  add_index "recommendations", ["user_id", "created_at"], :name => "index_recommendations_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "account"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end

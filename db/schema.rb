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

ActiveRecord::Schema.define(version: 20140205022808) do

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.integer  "intention_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["intention_id"], name: "index_goals_on_intention_id"
  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "intentions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "word_id"
    t.integer  "intention_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["intention_id"], name: "index_matches_on_intention_id"
  add_index "matches", ["word_id"], name: "index_matches_on_word_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  create_table "words", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

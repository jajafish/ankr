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

ActiveRecord::Schema.define(version: 20140210053228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "directives", force: true do |t|
    t.integer  "intention_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "directives", ["category_id"], name: "index_directives_on_category_id", using: :btree
  add_index "directives", ["intention_id"], name: "index_directives_on_intention_id", using: :btree

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.integer  "intention_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["intention_id"], name: "index_goals_on_intention_id", using: :btree
  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "intentions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
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

  add_index "matches", ["intention_id"], name: "index_matches_on_intention_id", using: :btree
  add_index "matches", ["word_id"], name: "index_matches_on_word_id", using: :btree

  create_table "rockouts", force: true do |t|
    t.integer  "band_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rockouts", ["band_id"], name: "index_rockouts_on_band_id", using: :btree
  add_index "rockouts", ["user_id"], name: "index_rockouts_on_user_id", using: :btree

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

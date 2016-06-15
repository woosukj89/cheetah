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

ActiveRecord::Schema.define(version: 20160605235213) do

  create_table "profiles", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password"
    t.string   "profile_pic"
    t.integer  "capacity"
    t.integer  "load"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string   "project"
    t.string   "sprint"
    t.string   "title"
    t.integer  "story_points"
    t.integer  "priority"
    t.string   "keyword"
    t.text     "acceptance_criteria"
    t.text     "description"
    t.string   "color"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories_tags", id: false, force: :cascade do |t|
    t.integer "stories_id"
    t.integer "tags_id"
  end

  add_index "stories_tags", ["stories_id"], name: "index_stories_tags_on_stories_id"
  add_index "stories_tags", ["tags_id"], name: "index_stories_tags_on_tags_id"

  create_table "tags", force: :cascade do |t|
    t.integer "type"
    t.string  "value"
    t.string  "label"
    t.string  "note"
    t.boolean "note_enabled"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "description"
    t.integer  "hours_total"
    t.integer  "hours_left"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "story_id"
  end

  create_table "tasks_profiles", id: false, force: :cascade do |t|
    t.integer "tasks_id"
    t.integer "profiles_id"
  end

  add_index "tasks_profiles", ["profiles_id"], name: "index_tasks_profiles_on_profiles_id"
  add_index "tasks_profiles", ["tasks_id"], name: "index_tasks_profiles_on_tasks_id"

end

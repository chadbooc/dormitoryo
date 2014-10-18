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

ActiveRecord::Schema.define(version: 20141015062337) do

  create_table "admins", force: true do |t|
    t.string  "username"
    t.integer "dorm_id"
  end

  create_table "announcements", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "header"
  end

  create_table "applicants", force: true do |t|
    t.integer "dorm_id"
    t.integer "student_number"
    t.integer "priority"
    t.boolean "is_renewing",    default: false
  end

  add_index "applicants", ["dorm_id"], name: "index_applicants_on_dorm_id", using: :btree

  create_table "dorm_allotments", force: true do |t|
    t.integer "dorm_id"
    t.integer "freshie_m",    default: 0
    t.integer "freshie_f",    default: 0
    t.integer "upperclass_m", default: 0
    t.integer "upperclass_f", default: 0
    t.integer "graduate_m",   default: 0
    t.integer "graduate_f",   default: 0
  end

  create_table "dorms", force: true do |t|
    t.string  "dorm_name"
    t.integer "occupied_slots", default: 0
    t.integer "total_slots",    default: 0
  end

  create_table "records", force: true do |t|
    t.integer "student_number"
    t.string  "first_name"
    t.string  "middle_name"
    t.string  "last_name"
    t.string  "region"
    t.string  "sts_bracket"
    t.integer "app_status"
    t.string  "sex"
    t.string  "student_tag"
  end

  create_table "residents", force: true do |t|
    t.integer "student_number"
    t.integer "dorm_id"
  end

  add_index "residents", ["dorm_id"], name: "index_residents_on_dorm_id", using: :btree

  create_table "users", force: true do |t|
    t.integer "student_number"
    t.string  "username"
    t.string  "password_hash"
    t.string  "password_salt"
  end

end

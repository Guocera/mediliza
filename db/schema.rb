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

ActiveRecord::Schema.define(version: 20160128162658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "patient_id"
    t.string   "observation"
    t.integer  "walking_duration"
    t.string   "beverage"
    t.datetime "time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "interactions", ["patient_id"], name: "index_interactions_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "staff_id"
    t.string   "beverage_type"
    t.string   "mobility_type"
    t.string   "language"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "patients", ["staff_id"], name: "index_patients_on_staff_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "patient_id"
    t.string   "description"
    t.boolean  "likes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "preferences", ["patient_id"], name: "index_preferences_on_patient_id", using: :btree

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password"
    t.integer  "personel_id"
    t.string   "personel_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["personel_type", "personel_id"], name: "index_users_on_personel_type_and_personel_id", using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

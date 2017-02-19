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

ActiveRecord::Schema.define(version: 20170219102719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "predictions", force: :cascade do |t|
    t.datetime "date"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.datetime "date"
    t.float    "glycemia"
    t.float    "carbohydrates"
    t.float    "meal_insulin"
    t.float    "correction_insulin"
    t.float    "activity"
    t.text     "notes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_records_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "",      null: false
    t.string   "encrypted_password",      default: "",      null: false
    t.string   "authentication_token"
    t.string   "username",                default: "",      null: false
    t.string   "glycemia_unit",           default: "mg/dL", null: false
    t.float    "carbohydrates_to_unit",   default: 1.0,     null: false
    t.float    "target_glycemia",         default: 100.0,   null: false
    t.float    "insulin_to_unit",         default: 1.0,     null: false
    t.float    "correction_factor",       default: 1.0,     null: false
    t.float    "hyperglycemia_threshold", default: 120.0,   null: false
    t.float    "hypoglycemia_threshold",  default: 80.0,    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "full_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "records", "users"
end

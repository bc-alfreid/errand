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

ActiveRecord::Schema.define(version: 20161201094042) do

  create_table "locations", force: :cascade do |t|
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
    t.integer  "run_registration_id", limit: 4
    t.integer  "run_request_id",      limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "address_line1",       limit: 255
    t.string   "address_line2",       limit: 255
    t.string   "city",                limit: 255
    t.string   "postcode",            limit: 255
    t.string   "state",               limit: 255
    t.string   "country",             limit: 255
  end

  add_index "locations", ["run_registration_id"], name: "index_locations_on_run_registration_id", using: :btree
  add_index "locations", ["run_request_id"], name: "index_locations_on_run_request_id", using: :btree

  create_table "offer_to_run_transactions", force: :cascade do |t|
    t.string   "runner_id",      limit: 255
    t.string   "run_request_id", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.string   "phone",        limit: 255
    t.string   "adress_line1", limit: 255
    t.string   "adress_line2", limit: 255
    t.string   "city",         limit: 255
    t.string   "postcode",     limit: 255
    t.string   "state",        limit: 255
    t.string   "country",      limit: 255
    t.string   "photo",        limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "avatars",      limit: 255
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "request_for_runner_transactions", force: :cascade do |t|
    t.string   "runner_requestor_id", limit: 255
    t.string   "run_registration_id", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "run_registrations", force: :cascade do |t|
    t.string   "location_from_adress_line1",   limit: 255
    t.string   "location_from_adress_line2",   limit: 255
    t.string   "location_from_city",           limit: 255
    t.string   "location_from_postcode",       limit: 255
    t.string   "location_from_adress_state",   limit: 255
    t.string   "location_from_adress_country", limit: 255
    t.string   "location_to_adress_line1",     limit: 255
    t.string   "location_to_adress_line2",     limit: 255
    t.string   "location_to_city",             limit: 255
    t.string   "location_to_postcode",         limit: 255
    t.string   "location_to_adress_state",     limit: 255
    t.string   "location_to_adress_country",   limit: 255
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "user_id",                      limit: 4
    t.string   "desciption",                   limit: 255
    t.text     "message",                      limit: 65535
    t.float    "latitude",                     limit: 24
    t.float    "longitude",                    limit: 24
    t.integer  "from_id",                      limit: 4
    t.integer  "to_id",                        limit: 4
  end

  add_index "run_registrations", ["user_id"], name: "index_run_registrations_on_user_id", using: :btree

  create_table "run_requests", force: :cascade do |t|
    t.string   "location_from_adress_line1",   limit: 255
    t.string   "location_from_adress_line2",   limit: 255
    t.string   "location_from_city",           limit: 255
    t.string   "location_from_postcode",       limit: 255
    t.string   "location_from_adress_state",   limit: 255
    t.string   "location_from_adress_country", limit: 255
    t.string   "location_to_adress_line1",     limit: 255
    t.string   "location_to_adress_line2",     limit: 255
    t.string   "location_to_city",             limit: 255
    t.string   "location_to_postcode",         limit: 255
    t.string   "location_to_adress_state",     limit: 255
    t.string   "location_to_adress_country",   limit: 255
    t.date     "date_to"
    t.integer  "user_id",                      limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "desrciption",                  limit: 255
    t.text     "message",                      limit: 65535
    t.integer  "from_id",                      limit: 4
    t.integer  "to_id",                        limit: 4
  end

  add_index "run_requests", ["user_id"], name: "index_run_requests_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "locations", "run_registrations"
  add_foreign_key "locations", "run_requests"
  add_foreign_key "profiles", "users"
  add_foreign_key "run_registrations", "users"
  add_foreign_key "run_requests", "users"
end

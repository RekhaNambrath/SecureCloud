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

ActiveRecord::Schema.define(version: 20160209172414) do

  create_table "file_uploads", force: :cascade do |t|
    t.string   "fname",      limit: 255
    t.string   "owner",      limit: 255
    t.string   "ftype",      limit: 255
    t.text     "keywords",   limit: 65535
    t.string   "attachment", limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "hash_val",   limit: 255,   default: ""
    t.integer  "user_id",    limit: 4
  end

  add_index "file_uploads", ["user_id"], name: "index_file_uploads_on_user_id", using: :btree

  create_table "request_messages", force: :cascade do |t|
    t.string   "file_hash",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id",        limit: 4
    t.integer  "file_upload_id", limit: 4
    t.integer  "status_code",    limit: 4
  end

  add_index "request_messages", ["file_upload_id"], name: "index_request_messages_on_file_upload_id", using: :btree
  add_index "request_messages", ["user_id"], name: "index_request_messages_on_user_id", using: :btree

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "tpa_csps", force: :cascade do |t|
    t.integer  "status_code",    limit: 4
    t.string   "file_hash",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "file_upload_id", limit: 4
  end

  add_index "tpa_csps", ["file_upload_id"], name: "index_tpa_csps_on_file_upload_id", using: :btree

  create_table "tpas", force: :cascade do |t|
    t.string   "file_hash",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "file_upload_id", limit: 4
  end

  add_index "tpas", ["file_upload_id"], name: "index_tpas_on_file_upload_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.date     "date_of_birth"
    t.string   "gender",          limit: 255
    t.string   "reset_digest",    limit: 255
    t.datetime "reset_sent_at"
    t.boolean  "tpa",                         default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "file_uploads", "users"
  add_foreign_key "request_messages", "file_uploads"
  add_foreign_key "request_messages", "users"
  add_foreign_key "tpa_csps", "file_uploads"
  add_foreign_key "tpas", "file_uploads"
end

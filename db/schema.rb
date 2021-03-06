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

ActiveRecord::Schema.define(version: 20150210063155) do

  create_table "apply_records", force: :cascade do |t|
    t.string   "personcategory"
    t.string   "item"
    t.string   "timelimit"
    t.string   "artcategory"
    t.string   "organization"
    t.string   "state"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "user"
    t.string   "shenqingfuhe"
    t.string   "jianding"
    t.string   "jiandingfuhe"
    t.string   "zhengshucaoli"
    t.string   "zhengshufafang"
    t.string   "zhengshubangding"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "touser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tousername"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.decimal  "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "username"
    t.string   "usercategory"
    t.string   "phonenumber"
    t.string   "job"
    t.string   "realname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

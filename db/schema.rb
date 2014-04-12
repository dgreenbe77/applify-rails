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

ActiveRecord::Schema.define(version: 20140412170527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_applications", force: true do |t|
    t.string   "company"
    t.string   "job_title"
    t.string   "website"
    t.string   "application_date"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_applications", ["user_id"], name: "index_job_applications_on_user_id", using: :btree

  create_table "job_infos", force: true do |t|
    t.integer  "user_id",         null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "contact_email",   null: false
    t.string   "address",         null: false
    t.string   "city",            null: false
    t.string   "state",           null: false
    t.string   "zip_code",        null: false
    t.string   "resume",          null: false
    t.string   "cover_letter"
    t.string   "home_phone",      null: false
    t.string   "work_phone"
    t.string   "cell_phone"
    t.string   "desired_salary"
    t.string   "current_salary"
    t.string   "primary_contact"
    t.string   "title",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "daily_schedule",  null: false
    t.string   "work_auth",       null: false
  end

  add_index "job_infos", ["contact_email"], name: "index_job_infos_on_contact_email", unique: true, using: :btree
  add_index "job_infos", ["user_id"], name: "index_job_infos_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20160628174519) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",                                             null: false
    t.string   "picture",         default: "documents/avatar.svg"
    t.text     "description"
    t.string   "fields"
    t.string   "address"
    t.string   "email",                                            null: false
    t.string   "siret"
    t.string   "password_digest"
    t.boolean  "hidden",          default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "student_id"
    t.string   "name"
    t.string   "state",       default: "waiting"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "jobs", ["project_id"], name: "index_jobs_on_project_id"
  add_index "jobs", ["student_id"], name: "index_jobs_on_student_id"

  create_table "projectfiles", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name",        null: false
    t.text     "description"
    t.string   "path",        null: false
    t.string   "mime_type"
    t.decimal  "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projectfiles", ["project_id"], name: "index_projectfiles_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name",                            null: false
    t.string   "fields"
    t.text     "description"
    t.decimal  "salary"
    t.date     "end_date"
    t.string   "state",       default: "created"
    t.text     "diary"
    t.boolean  "hidden",      default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "projects", ["company_id"], name: "index_projects_on_company_id"

  create_table "students", force: :cascade do |t|
    t.string   "first_name",                                       null: false
    t.string   "last_name",                                        null: false
    t.string   "nick_name"
    t.string   "rank",            default: "minion"
    t.string   "picture",         default: "documents/avatar.svg"
    t.string   "semester"
    t.string   "fields"
    t.text     "description"
    t.string   "email",                                            null: false
    t.string   "phone"
    t.string   "secu_number"
    t.string   "rib"
    t.string   "resume"
    t.boolean  "admin",           default: false
    t.string   "password_digest"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

end

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

ActiveRecord::Schema.define(version: 20150316043530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "course_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "directories", force: true do |t|
    t.string "office"
    t.string "local_numbers"
  end

  create_table "events", force: true do |t|
    t.string  "month"
    t.string  "day"
    t.text    "caption"
    t.integer "year"
    t.integer "sem"
  end

  create_table "grades", force: true do |t|
    t.string   "student_number"
    t.integer  "year"
    t.text     "sem"
    t.string   "subject_code"
    t.string   "prelim"
    t.string   "midterm"
    t.string   "final"
    t.string   "sem_grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_code"
    t.text     "description"
    t.integer  "unit_lec"
    t.integer  "unit_lab"
    t.integer  "year_grade_id"
  end

  create_table "newsfeeds", force: true do |t|
    t.string   "title"
    t.string   "department"
    t.datetime "event_date"
    t.text     "description"
    t.text     "path_name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "path"
  end

  create_table "schedules", force: true do |t|
    t.integer "day"
    t.string  "time"
    t.string  "subject_id"
    t.string  "section_id"
    t.string  "room"
  end

  create_table "section_schedules", force: true do |t|
    t.string   "course_code"
    t.integer  "section_id"
    t.string   "student_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "course_code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  create_table "students", force: true do |t|
    t.string   "student_number"
    t.string   "access_code"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "extension_name"
    t.integer  "course_id"
    t.string   "curriculum_year"
    t.string   "enrollment_status"
    t.integer  "gender"
    t.datetime "birthday"
    t.string   "birthplace"
    t.string   "civil_status"
    t.string   "nationality"
    t.string   "religion"
    t.text     "address"
    t.string   "city"
    t.string   "contact_number"
    t.string   "email"
    t.string   "guardian_name"
    t.string   "guardian_address"
    t.string   "guardian_contact_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit_allowed"
    t.string   "year_level"
    t.text     "path"
  end

  create_table "subjects", force: true do |t|
    t.string   "subject_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_code"
    t.integer  "unit_lec"
    t.integer  "unit_lab"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "warnings", force: true do |t|
    t.integer "category"
    t.string  "title"
    t.text    "caption"
    t.string  "student_number"
  end

  create_table "year_grades", force: true do |t|
    t.string   "course_code"
    t.integer  "section_id"
    t.integer  "year"
    t.integer  "sem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

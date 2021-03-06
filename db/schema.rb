# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_01_145924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "created_by_id", null: false
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.integer "votes_count", default: 0
    t.integer "inscriptions_count", default: 0
    t.index ["created_by_id"], name: "index_courses_on_created_by_id"
    t.index ["discarded_at"], name: "index_courses_on_discarded_at"
    t.index ["name"], name: "index_courses_on_name", unique: true
  end

  create_table "inscriptions", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_inscriptions_on_course_id"
    t.index ["teacher_id", "course_id"], name: "index_inscriptions_on_teacher_id_and_course_id", unique: true
    t.index ["teacher_id"], name: "index_inscriptions_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "skills", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "votes_count", default: 0
    t.integer "inscriptions_count", default: 0
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "voter_id"
    t.string "voteable_type"
    t.bigint "voteable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id"
    t.index ["voter_id", "voteable_id", "voteable_type"], name: "index_votes_on_voter_id_and_voteable_id_and_voteable_type", unique: true
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "courses", "teachers", column: "created_by_id"
  add_foreign_key "inscriptions", "courses"
  add_foreign_key "inscriptions", "teachers"
  add_foreign_key "votes", "teachers", column: "voter_id"
end

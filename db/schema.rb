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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130723173224) do

  create_table "banner_degrees", :force => true do |t|
    t.string   "name"
    t.string   "student_number"
    t.date     "expected_completion"
    t.date     "graduation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.string   "program_code"
  end

  add_index "banner_degrees", ["student_id"], :name => "index_banner_degrees_on_student_id"

  create_table "banner_program_enrollments", :force => true do |t|
    t.string   "name"
    t.string   "enrollment_status"
    t.string   "student_level"
    t.string   "residency"
    t.string   "program"
    t.string   "student_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
  end

  add_index "banner_program_enrollments", ["student_id"], :name => "index_banner_program_enrollments_on_student_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colleges", :force => true do |t|
    t.string   "name"
    t.integer  "programs_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "colleges", ["school_id"], :name => "index_colleges_on_school_id"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
    t.string   "course_code"
    t.string   "course_level"
    t.string   "program"
    t.float    "credit_hours", :limit => 5
    t.string   "hashed_name"
    t.string   "head_count"
    t.float    "fte",          :limit => 6
    t.integer  "room_id"
  end

  add_index "courses", ["program_id"], :name => "index_courses_on_program_id"
  add_index "courses", ["room_id"], :name => "index_courses_on_room_id"

  create_table "ftes", :force => true do |t|
    t.string   "term"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resident_status"
    t.float    "fte"
    t.integer  "school_id"
    t.string   "academic_year"
  end

  add_index "ftes", ["school_id"], :name => "index_ftes_on_school_id"

  create_table "grades", :force => true do |t|
    t.string   "term"
    t.string   "course_name"
    t.string   "section_number"
    t.string   "grade_definition"
    t.string   "grade"
    t.float    "credit_hours"
    t.string   "course_code"
    t.string   "course_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "source"
    t.integer  "student_id"
    t.date     "start_date"
    t.date     "end_date"
  end

  add_index "grades", ["student_id"], :name => "index_grades_on_student_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "serial_number"
    t.string   "asset_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room_id"
    t.integer  "source_id"
  end

  add_index "items", ["room_id"], :name => "index_items_on_room_id"
  add_index "items", ["source_id"], :name => "index_items_on_source_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.integer  "courses_count",                :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "college_id"
    t.integer  "headcount_2011"
    t.integer  "headcount_2012"
    t.integer  "headcount_2013"
    t.float    "fall_2012_fte",   :limit => 6
    t.float    "spring_2013_fte", :limit => 6
    t.float    "summer_2013_fte", :limit => 6
    t.float    "fte_2013",        :limit => 8
    t.integer  "withdrawals"
    t.integer  "graduates"
  end

  add_index "programs", ["college_id"], :name => "index_programs_on_college_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  add_index "rooms", ["location_id"], :name => "index_rooms_on_location_id"

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "colleges_count", :default => 0, :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "student_number"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "race"
    t.string   "ethnicity"
    t.string   "nationality"
    t.string   "origin_country"
    t.string   "gender"
    t.string   "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "invited"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end

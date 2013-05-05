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

ActiveRecord::Schema.define(:version => 20130505180439) do

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
  end

  add_index "courses", ["program_id"], :name => "index_courses_on_program_id"

  create_table "grades", :force => true do |t|
    t.text     "snumber",          :limit => 2147483647
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
  end

  create_table "ipeds_stage", :id => false, :force => true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "ssn"
    t.string "student_number"
    t.string "gender"
    t.string "c_f_hispanic_yes_no"
    t.string "c_f_race"
    t.string "hispanic_yes_no"
    t.string "race"
    t.string "birth_country"
    t.string "country_of_citizenship"
    t.string "visa_type"
    t.string "residency_status"
    t.string "hb_1023"
    t.string "visa_perm_residence_card"
    t.string "alien_registration_number"
    t.string "visa_issue_date"
    t.string "visa_exp_date"
    t.string "affidavit"
    t.string "approved_by_save"
    t.string "enrollment_code"
    t.string "student_attributes"
    t.string "concurrent_enrollment_school"
    t.string "birth_date"
    t.string "age"
    t.string "course_code"
    t.string "course_name"
    t.string "course_section"
    t.string "course_section_id"
    t.string "course_enrollment_term"
    t.string "program"
    t.string "program_enrollment_term"
    t.string "credit_hour"
    t.string "course_start_date"
    t.string "course_end_date"
    t.string "student_start_date"
    t.string "student_expected_end_date"
    t.string "finalized_date"
    t.string "finalized_grade"
    t.string "enrollment_code_2"
    t.string "high_school_diploma_date"
    t.string "ged_date"
    t.string "highest_education_level"
    t.string "higher_ed_tp_1"
    t.string "higher_ed_tp_2"
    t.string "enrollment_status"
  end

  add_index "ipeds_stage", ["enrollment_status"], :name => "enrollment_status"
  add_index "ipeds_stage", ["program"], :name => "program"
  add_index "ipeds_stage", ["student_number"], :name => "student_number"

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.integer  "courses_count",   :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "college_id"
    t.integer  "headcount_2011"
    t.integer  "headcount_2012"
    t.integer  "headcount_2013"
    t.float    "fall_2012_fte"
    t.float    "spring_2013_fte"
    t.float    "summer_2013_fte"
    t.float    "fte_2013"
  end

  add_index "programs", ["college_id"], :name => "index_programs_on_college_id"

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "colleges_count", :default => 0, :null => false
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
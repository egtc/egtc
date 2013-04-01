class HoboMigration7 < ActiveRecord::Migration
  def self.up
    drop_table :_grades_old_20130401

    add_column :grades, :name, :string
  end

  def self.down
    remove_column :grades, :name

    create_table "_grades_old_20130401", :force => true do |t|
      t.string   "student_number"
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
    end
  end
end

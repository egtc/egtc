class HoboMigration6 < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.string   :student_number
      t.string   :term
      t.string   :course_name
      t.string   :section_number
      t.string   :grade_definition
      t.string   :grade
      t.float    :credit_hours
      t.string   :course_code
      t.string   :course_level
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :grades
  end
end

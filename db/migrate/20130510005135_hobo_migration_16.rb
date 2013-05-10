class HoboMigration16 < ActiveRecord::Migration
  def self.up
    add_column :courses, :course_code, :string
    add_column :courses, :course_level, :string
    add_column :courses, :program, :string
    add_column :courses, :credit_hours, :decimal

    remove_index :students, :name => :student_number rescue ActiveRecord::StatementInvalid
    remove_index :students, :name => :name rescue ActiveRecord::StatementInvalid

    remove_index :banner_program_enrollments, :name => :student_number rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :courses, :course_code
    remove_column :courses, :course_level
    remove_column :courses, :program
    remove_column :courses, :credit_hours

    add_index :students, [:student_number], :name => 'student_number'
    add_index :students, [:name], :name => 'name'

    add_index :banner_program_enrollments, [:name], :name => 'student_number'
  end
end

class HoboMigration1 < ActiveRecord::Migration
  def self.up
    change_column :colleges, :name, :string, :limit => 255
    change_column :colleges, :programs_count, :integer, :limit => 4, :null => false, :default => 0
    change_column :colleges, :created_at, :datetime, :limit => nil
    change_column :colleges, :updated_at, :datetime, :limit => nil

    change_column :courses, :name, :string, :limit => 255
    change_column :courses, :created_at, :datetime, :limit => nil
    change_column :courses, :updated_at, :datetime, :limit => nil

    change_column :programs, :title, :string, :limit => 255
    change_column :programs, :courses_count, :integer, :limit => 4, :null => false, :default => 0
    change_column :programs, :created_at, :datetime, :limit => nil
    change_column :programs, :updated_at, :datetime, :limit => nil

    add_column :grades, :source, :string
    change_column :grades, :term, :string, :limit => 255
    change_column :grades, :course_name, :string, :limit => 255
    change_column :grades, :section_number, :string, :limit => 255
    change_column :grades, :grade_definition, :string, :limit => 255
    change_column :grades, :grade, :string, :limit => 255
    change_column :grades, :course_code, :string, :limit => 255
    change_column :grades, :course_level, :string, :limit => 255
    change_column :grades, :created_at, :datetime, :limit => nil
    change_column :grades, :updated_at, :datetime, :limit => nil
    change_column :grades, :name, :string, :limit => 255
  end

  def self.down
    change_column :colleges, :name, :text, :limit => 2147483647
    change_column :colleges, :programs_count, :integer, :null => false
    change_column :colleges, :created_at, :binary, :limit => 2147483647
    change_column :colleges, :updated_at, :binary, :limit => 2147483647

    change_column :courses, :name, :text, :limit => 2147483647
    change_column :courses, :created_at, :binary, :limit => 2147483647
    change_column :courses, :updated_at, :binary, :limit => 2147483647

    change_column :programs, :title, :text, :limit => 2147483647
    change_column :programs, :courses_count, :integer, :null => false
    change_column :programs, :created_at, :binary, :limit => 2147483647
    change_column :programs, :updated_at, :binary, :limit => 2147483647

    remove_column :grades, :source
    change_column :grades, :term, :text, :limit => 2147483647
    change_column :grades, :course_name, :text, :limit => 2147483647
    change_column :grades, :section_number, :text, :limit => 2147483647
    change_column :grades, :grade_definition, :text, :limit => 2147483647
    change_column :grades, :grade, :text, :limit => 2147483647
    change_column :grades, :course_code, :text, :limit => 2147483647
    change_column :grades, :course_level, :text, :limit => 2147483647
    change_column :grades, :created_at, :binary, :limit => 2147483647
    change_column :grades, :updated_at, :binary, :limit => 2147483647
    change_column :grades, :name, :text, :limit => 2147483647
  end
end

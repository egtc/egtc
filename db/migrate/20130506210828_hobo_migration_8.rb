class HoboMigration8 < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string   :student_number
      t.string   :first_name
      t.string   :middle_name
      t.string   :last_name
      t.string   :race
      t.string   :ethnicity
      t.string   :nationality
      t.string   :origin_country
      t.string   :gender
      t.string   :dob
      t.datetime :created_at
      t.datetime :updated_at
    end

    remove_column :grades, :snumber
  end

  def self.down
    add_column :grades, :snumber, :text, :limit => 2147483647

    drop_table :students
  end
end

class HoboMigration15 < ActiveRecord::Migration
  def self.up
    create_table :banner_program_enrollments do |t|
      t.string   :name
      t.string   :enrollment_status
      t.string   :student_level
      t.string   :residency
      t.string   :program
      t.string   :student_type
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :student_id
    end
    add_index :banner_program_enrollments, [:student_id]

    remove_index :students, :name => :student_number rescue ActiveRecord::StatementInvalid
    remove_index :students, :name => :name rescue ActiveRecord::StatementInvalid

    remove_index :grades, :name => :name rescue ActiveRecord::StatementInvalid
  end

  def self.down
    drop_table :banner_program_enrollments

    add_index :students, [:student_number], :name => 'student_number'
    add_index :students, [:name], :name => 'name'

    add_index :grades, [:name], :name => 'name'
  end
end

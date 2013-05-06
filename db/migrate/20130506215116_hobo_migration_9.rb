class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :grades, :student_id, :integer

    add_column :students, :studentnumber, :string

    add_index :grades, [:student_id]
  end

  def self.down
    remove_column :grades, :student_id

    remove_column :students, :studentnumber

    remove_index :grades, :name => :index_grades_on_student_id rescue ActiveRecord::StatementInvalid
  end
end

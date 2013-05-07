class HoboMigration14 < ActiveRecord::Migration
  def self.up
    add_column :banner_degrees, :program_code, :string
    remove_column :banner_degrees, :progam_code

    remove_index :students, :name => :name rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :banner_degrees, :program_code
    add_column :banner_degrees, :progam_code, :string

    add_index :students, [:student_number], :name => 'name'
  end
end

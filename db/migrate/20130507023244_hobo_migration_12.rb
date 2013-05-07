class HoboMigration12 < ActiveRecord::Migration
  def self.up
    create_table :banner_degrees do |t|
      t.string   :name
      t.string   :student_number
      t.date     :expected_completion
      t.date     :graduation_date
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :student_id
    end
    add_index :banner_degrees, [:student_id]

    remove_index :students, :name => :student_number rescue ActiveRecord::StatementInvalid
  end

  def self.down
    drop_table :banner_degrees

    add_index :students, [:name], :name => 'student_number'
  end
end

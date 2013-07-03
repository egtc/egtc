class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :ftes do |t|
      t.string   :title
      t.string   :term
      t.string   :level
      t.float    :resident_headcount
      t.float    :resident_credit_hours
      t.string   :resident_FTE
      t.float    :nonresident_headcount
      t.float    :nonresident_credit_hours
      t.float    :nonresident_fte
      t.float    :other_headcount
      t.float    :other_credit_hours
      t.float    :other_fte
      t.datetime :created_at
      t.datetime :updated_at
    end

    remove_index :students, :name => :name rescue ActiveRecord::StatementInvalid
    remove_index :students, :name => :student_number rescue ActiveRecord::StatementInvalid

    remove_index :grades, :name => :name rescue ActiveRecord::StatementInvalid
  end

  def self.down
    drop_table :ftes

    add_index :students, [:name], :name => 'name'
    add_index :students, [:student_number], :name => 'student_number'

    add_index :grades, [:name], :name => 'name'
  end
end

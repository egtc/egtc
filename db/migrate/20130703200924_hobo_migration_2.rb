class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :ftes, :resident_status, :string
    add_column :ftes, :fte, :float
    add_column :ftes, :school_id, :integer
    remove_column :ftes, :level
    remove_column :ftes, :resident_headcount
    remove_column :ftes, :resident_credit_hours
    remove_column :ftes, :resident_FTE
    remove_column :ftes, :nonresident_headcount
    remove_column :ftes, :nonresident_credit_hours
    remove_column :ftes, :nonresident_fte
    remove_column :ftes, :other_headcount
    remove_column :ftes, :other_credit_hours
    remove_column :ftes, :other_fte

    add_index :ftes, [:school_id]
  end

  def self.down
    remove_column :ftes, :resident_status
    remove_column :ftes, :fte
    remove_column :ftes, :school_id
    add_column :ftes, :level, :string
    add_column :ftes, :resident_headcount, :float
    add_column :ftes, :resident_credit_hours, :float
    add_column :ftes, :resident_FTE, :string
    add_column :ftes, :nonresident_headcount, :float
    add_column :ftes, :nonresident_credit_hours, :float
    add_column :ftes, :nonresident_fte, :float
    add_column :ftes, :other_headcount, :float
    add_column :ftes, :other_credit_hours, :float
    add_column :ftes, :other_fte, :float

    remove_index :ftes, :name => :index_ftes_on_school_id rescue ActiveRecord::StatementInvalid
  end
end

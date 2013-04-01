class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :programs, :headcount_2011, :integer
    add_column :programs, :headcount_2012, :integer
    add_column :programs, :headcount_2013, :integer
    add_column :programs, :fall_2012_fte, :float
    add_column :programs, :spring_2013_fte, :float
    add_column :programs, :summer_2013_fte, :float
    add_column :programs, :fte_2013, :float
  end

  def self.down
    remove_column :programs, :headcount_2011
    remove_column :programs, :headcount_2012
    remove_column :programs, :headcount_2013
    remove_column :programs, :fall_2012_fte
    remove_column :programs, :spring_2013_fte
    remove_column :programs, :summer_2013_fte
    remove_column :programs, :fte_2013
  end
end

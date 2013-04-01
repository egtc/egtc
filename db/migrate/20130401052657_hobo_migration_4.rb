class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :schools, :colleges_count, :integer, :default => 0, :null => false
    remove_column :schools, :programs_count
  end

  def self.down
    remove_column :schools, :colleges_count
    add_column :schools, :programs_count, :integer, :default => 0, :null => false
  end
end

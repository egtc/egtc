class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :ftes, :academic_year, :string
    remove_column :ftes, :title
  end

  def self.down
    remove_column :ftes, :academic_year
    add_column :ftes, :title, :string
  end
end

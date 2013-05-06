class HoboMigration10 < ActiveRecord::Migration
  def self.up
    add_column :students, :name, :string
    remove_column :students, :studentnumber
  end

  def self.down
    remove_column :students, :name
    add_column :students, :studentnumber, :string
  end
end

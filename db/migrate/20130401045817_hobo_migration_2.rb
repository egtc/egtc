class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :schools, :school_name, :string
  end

  def self.down
    remove_column :schools, :school_name
  end
end

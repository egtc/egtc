class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :programs, :new_test, :integer
  end

  def self.down
    remove_column :programs, :new_test
  end
end

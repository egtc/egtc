class HoboMigration3 < ActiveRecord::Migration
  def self.up
    remove_column :programs, :new_test
  end

  def self.down
    add_column :programs, :new_test, :integer
  end
end

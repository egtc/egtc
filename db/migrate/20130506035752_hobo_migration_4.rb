class HoboMigration4 < ActiveRecord::Migration
  def self.up
    remove_column :programs, :withdrawal_count
  end

  def self.down
    add_column :programs, :withdrawal_count, :integer
  end
end

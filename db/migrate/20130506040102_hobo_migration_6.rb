class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :programs, :withdrawals, :integer
    remove_column :programs, :withdrawal_count
  end

  def self.down
    remove_column :programs, :withdrawals
    add_column :programs, :withdrawal_count, :integer
  end
end

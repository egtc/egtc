class HoboMigration17 < ActiveRecord::Migration
  def self.up
    change_column :courses, :credit_hours, :decimal, :limit => nil
  end

  def self.down
    change_column :courses, :credit_hours, :decimal, :precision => 10, :scale => 0
  end
end

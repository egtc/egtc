class HoboMigration22 < ActiveRecord::Migration
  def self.up
    change_column :courses, :credit_hours, :float, :limit => nil
    change_column :courses, :fte, :float, :limit => nil
  end

  def self.down
    change_column :courses, :credit_hours, :decimal, :precision => 10, :scale => 0
    change_column :courses, :fte, :decimal, :precision => 10, :scale => 0
  end
end

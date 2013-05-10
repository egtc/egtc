class HoboMigration21 < ActiveRecord::Migration
  def self.up
    add_column :courses, :fte, :decimal
    change_column :courses, :credit_hours, :decimal, :limit => nil
    change_column :courses, :head_count, :string, :limit => 255
  end

  def self.down
    remove_column :courses, :fte
    change_column :courses, :credit_hours, :decimal, :precision => 10, :scale => 0
    change_column :courses, :head_count, :integer
  end
end

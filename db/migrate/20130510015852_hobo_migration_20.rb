class HoboMigration20 < ActiveRecord::Migration
  def self.up
    add_column :courses, :hashed_name, :string
    add_column :courses, :head_count, :string
    change_column :courses, :credit_hours, :decimal, :limit => nil
  end

  def self.down
    remove_column :courses, :hashed_name
    remove_column :courses, :head_count
    change_column :courses, :credit_hours, :decimal, :precision => 10, :scale => 0
  end
end

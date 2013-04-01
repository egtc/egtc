class HoboMigration3 < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string   :name
      t.integer  :programs_count, :default => 0, :null => false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :schools
  end
end

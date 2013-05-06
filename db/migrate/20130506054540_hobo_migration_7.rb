class HoboMigration7 < ActiveRecord::Migration
  def self.up
    add_column :programs, :graduates, :integer
  end

  def self.down
    remove_column :programs, :graduates
  end
end

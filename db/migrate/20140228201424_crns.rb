class Crns < ActiveRecord::Migration
  def self.up
    add_column :grades, :crn, :string
    add_column :grades, :flag_duplicate, :boolean
    add_column :grades, :comments, :text
  end

  def self.down
    remove_column :grades, :crn
    remove_column :grades, :flag_duplicate
    remove_column :grades, :comments
  end
end

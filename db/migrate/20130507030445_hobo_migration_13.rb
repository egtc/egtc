class HoboMigration13 < ActiveRecord::Migration
  def self.up
    add_column :banner_degrees, :progam_code, :string

    remove_index :students, :name => :name rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :banner_degrees, :progam_code

    add_index :students, [:name], :name => 'name'
  end
end

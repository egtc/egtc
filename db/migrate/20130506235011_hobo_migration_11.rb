class HoboMigration11 < ActiveRecord::Migration
  def self.up
    add_column :grades, :start_date, :date
    add_column :grades, :end_date, :date

    remove_index :grades, :name => :name rescue ActiveRecord::StatementInvalid

    remove_index :students, :name => :id rescue ActiveRecord::StatementInvalid
    remove_index :students, :name => :name rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :grades, :start_date
    remove_column :grades, :end_date

    add_index :grades, [:name], :name => 'name'

    add_index :students, [:id], :name => 'id'
    add_index :students, [:name], :name => 'name'
  end
end

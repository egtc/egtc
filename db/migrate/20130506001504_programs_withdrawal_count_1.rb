class ProgramsWithdrawalCount1 < ActiveRecord::Migration
  def self.up
    add_column :programs, :withdrawal_count, :integer
  end

  def self.down
    remove_column :programs, :withdrawal_count
  end
end

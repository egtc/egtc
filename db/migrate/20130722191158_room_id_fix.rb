class RoomIdFix < ActiveRecord::Migration
  def self.up
    add_column :rooms, :course_id, :integer
    remove_column :rooms, :room_id

    remove_index :rooms, :name => :index_rooms_on_room_id rescue ActiveRecord::StatementInvalid
    add_index :rooms, [:course_id]
  end

  def self.down
    remove_column :rooms, :course_id
    add_column :rooms, :room_id, :integer

    remove_index :rooms, :name => :index_rooms_on_course_id rescue ActiveRecord::StatementInvalid
    add_index :rooms, [:room_id]
  end
end

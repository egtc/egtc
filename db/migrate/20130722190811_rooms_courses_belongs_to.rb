class RoomsCoursesBelongsTo < ActiveRecord::Migration
  def self.up
    add_column :rooms, :room_id, :integer

    add_index :rooms, [:room_id]
  end

  def self.down
    remove_column :rooms, :room_id

    remove_index :rooms, :name => :index_rooms_on_room_id rescue ActiveRecord::StatementInvalid
  end
end

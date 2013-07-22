class InvertCoursesRooms < ActiveRecord::Migration
  def self.up
    add_column :courses, :room_id, :integer

    remove_column :rooms, :course_id

    add_index :courses, [:room_id]

    remove_index :rooms, :name => :index_rooms_on_course_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :courses, :room_id

    add_column :rooms, :course_id, :integer

    remove_index :courses, :name => :index_courses_on_room_id rescue ActiveRecord::StatementInvalid

    add_index :rooms, [:course_id]
  end
end

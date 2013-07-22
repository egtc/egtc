class RoomsLocations < ActiveRecord::Migration
  def self.up
    add_column :rooms, :location_id, :integer

    add_index :rooms, [:location_id]
  end

  def self.down
    remove_column :rooms, :location_id

    remove_index :rooms, :name => :index_rooms_on_location_id rescue ActiveRecord::StatementInvalid
  end
end

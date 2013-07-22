class LocationsAndRooms < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string   :name
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :zip
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :rooms do |t|
      t.string   :name
      t.integer  :capacity
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :locations
    drop_table :rooms
  end
end

class AddItemsRoomsSource < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :items do |t|
      t.string   :name
      t.string   :serial_number
      t.string   :asset_tag
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :room_id
    end
    add_index :items, [:room_id]

    create_table :sources do |t|
      t.string   :name
      t.string   :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :categories
    drop_table :items
    drop_table :sources
  end
end

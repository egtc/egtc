class Item < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name          :string
    serial_number :string
    asset_tag     :string
    timestamps
  end
  attr_accessible :name, :serial_number, :asset_tag, :source, :source_id, :room_id, :room
  belongs_to :room, :inverse_of => :items, :counter_cache => true
  belongs_to :source, :inverse_of => :items, :counter_cache => true

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end

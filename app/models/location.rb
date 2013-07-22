class Location < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name    :string
    address :string
    city    :string
    state   :string
    zip     :string
    timestamps
  end
  attr_accessible :name, :address, :city, :state, :zip
  has_many :rooms, :dependent => :destroy, :inverse_of => :location
  children :rooms
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

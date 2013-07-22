class Room < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name     :string
    capacity :integer
    timestamps
  end
  attr_accessible :name, :capacity, :course_id, :location
  has_many :courses, :dependent => :destroy, :inverse_of => :room
  belongs_to :location, :inverse_of => :rooms, :counter_cache => true
  
  children :courses

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

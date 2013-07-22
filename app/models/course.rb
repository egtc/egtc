class Course < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    course_code :string
    course_level :string
    program :string
    credit_hours :float
    hashed_name :string
    head_count :string
    fte :float
    timestamps
  end
  attr_accessible :name, :program, :program_id, :room
  belongs_to :program, :inverse_of => :courses, :counter_cache => true
  belongs_to :room, :inverse_of => :courses, :counter_cache => true
  


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

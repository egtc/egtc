class Course < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    course_code :string
    course_level :string
    program :string
    credit_hours :decimal
    timestamps
  end
  attr_accessible :name, :program, :program_id
  belongs_to :program, :inverse_of => :courses, :counter_cache => true

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

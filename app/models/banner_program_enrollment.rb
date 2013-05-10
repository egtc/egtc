class BannerProgramEnrollment < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name              :string
    enrollment_status :string
    student_level     :string
    residency         :string
    program           :string
    student_type      :string
    timestamps
  end
  attr_accessible :name, :enrollment_status, :student_level, :residency, :program, :student_type
  belongs_to :student, :inverse_of => :banner_program_enrollments, :counter_cache => true 

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

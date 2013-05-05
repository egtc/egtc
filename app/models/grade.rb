class Grade < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name   :string
    term             :string
    course_name      :string
    section_number   :string
    grade_definition :string
    grade            :string
    credit_hours     :float
    course_code      :string
    course_level     :string
    source           :string
    timestamps
  end
  attr_accessible :name, :term, :course_name, :section_number, :grade_definition, :grade, :credit_hours, :course_code, :course_level

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

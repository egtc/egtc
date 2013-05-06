class Student < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name           :string
    student_number :string
    first_name     :string
    middle_name    :string
    last_name      :string
    race           :string
    ethnicity      :string
    nationality    :string
    origin_country :string
    gender         :string
    dob            :string
    timestamps
  end
  attr_accessible :first_name, :middle_name, :last_name, :race, :ethnicity, :nationality, :origin_country, :gender, :dob
  has_many :grades
  children :grades

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

class Student < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name           :string, :index
    student_number :string, :index
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
  set_search_columns :first_name, :last_name, :name
  attr_accessible :first_name, :middle_name, :last_name, :race, :ethnicity, :nationality, :origin_country, :gender, :dob
  has_many :grades, :dependent => :destroy, :inverse_of => :student
  has_many :banner_degrees, :dependent => :destroy, :inverse_of => :student
  has_many :banner_program_enrollments, :dependent => :destroy, :inverse_of => :student
  children :grades, :banner_degrees

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

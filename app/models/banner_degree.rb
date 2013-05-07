class BannerDegree < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name                :string
    student_number      :string
    expected_completion :date
    graduation_date     :date
    program_code         :string
    timestamps
  end
  attr_accessible :name, :student_number, :expected_completion, :graduation_date, :program_code
  belongs_to :student, :inverse_of => :banner_degrees, :counter_cache => true 

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

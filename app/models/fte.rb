class Fte < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    academic_year            :string
    term                     :string
    resident_status          :string
    fte                      :float
  end
  attr_accessible :academic_year, :term, :resident_status, :fte

  belongs_to :school, :inverse_of => :ftes, :counter_cache => true
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

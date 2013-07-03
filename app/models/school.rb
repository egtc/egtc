class School < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    colleges_count :integer, :default => 0, :null => false
    timestamps
  end
  attr_accessible :name, :colleges, :academic_year, :term, :resident_status, :fte
  has_many :colleges, :dependent => :destroy, :inverse_of => :school
  has_many :ftes, :dependent => :destroy, :inverse_of => :school
  children :colleges, :ftes

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

class College < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    programs_count :integer, :default => 0, :null => false
    timestamps
  end
  attr_accessible :name, :programs_count, :school, :school_id, :programs
  
  belongs_to :school, :inverse_of => :colleges, :counter_cache => true
  has_many :programs, :dependent => :destroy, :inverse_of => :college
  children :programs

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

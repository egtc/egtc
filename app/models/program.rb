class Program < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string
    courses_count :integer, :default => 0, :null => false
    headcount_2011 :integer 
    headcount_2012 :integer 
    headcount_2013 :integer 
    fall_2012_fte :float 
    spring_2013_fte :float 
    summer_2013_fte :float 
    fte_2013 :float
    timestamps
  end
  attr_accessible :title, :college, :college_id, :courses
  belongs_to :college, :inverse_of => :programs, :counter_cache => true
  has_many :courses, :dependent => :destroy, :inverse_of => :program
  children :courses

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

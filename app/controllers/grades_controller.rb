class GradesController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
    @grades = find_instance
      search(params[:search], :snumber).
      order_by(parse_sort_param(:name))
    hobo_index
  end


end

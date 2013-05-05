class GradesController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
    @grades = find_instance
      search(params[:search], :name).
      order_by(parse_sort_param(:name))
    hobo_show
  end


end

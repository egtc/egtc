class ProgramsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
    @program = find_instance
    @courses = @program.courses.
      search(params[:search], :name).
      order_by(parse_sort_param(:name))
      hobo_show
    end

end

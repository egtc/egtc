class SchoolsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
     @school = find_instance
      @ftes = @school.ftes.
        search(params[:search], :academic_year).
        order_by(parse_sort_param(:academic_year))
        hobo_show
  end

end

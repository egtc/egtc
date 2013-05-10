class StudentsController < ApplicationController

  hobo_model_controller
  auto_actions :all
  
  def show
    @student = find_instance
    @grades = @student.grades.
      search(params[:search], :course_name).
      order_by(parse_sort_param(:term, :course_name))
      
      @student = find_instance
      @banner_program_enrollments = @student.banner_program_enrollments.
        search(params[:search], :program).
        order_by(parse_sort_param(:program))
     
    @student = find_instance
    @banner_degrees = @student.banner_degrees.
     search(params[:search], :program_code).
     order_by(parse_sort_param(:term, :graduation_date))
     

    hobo_show
  end

end

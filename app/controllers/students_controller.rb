class StudentsController < ApplicationController

  hobo_model_controller
  auto_actions :all
  
  def show
    @student = find_instance
    @grades = @student.grades.
      search(params[:search], :course_name).
      order_by(parse_sort_param(:term, :course_name))
     # @grades = @grades.course_name_is(params[:course_name]) if params[:course_name] && !params[:course_name].blank?
       @student = find_instance
       @banner_degrees = @student.banner_degrees.
         search(params[:search], :program_code).
         order_by(parse_sort_param(:term, :graduation_date))
    hobo_show
  end

end

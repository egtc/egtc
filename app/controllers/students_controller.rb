class StudentsController < ApplicationController

  hobo_model_controller
  auto_actions :all
  
  def show
    @student = find_instance
    @grades = @student.grades.
      search(params[:search], :course_name).
      order_by(parse_sort_param(:term, :course_name))
     # @grades = @grades.course_name_is(params[:course_name]) if params[:course_name] && !params[:course_name].blank?
    hobo_show
  end

end

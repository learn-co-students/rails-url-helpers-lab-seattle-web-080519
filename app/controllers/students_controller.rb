class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def activate
    @student = Student.find(params[:id])
    if @student.active 
      @student.active = false
    else
      @student.active = true
    end
    @student.active 
    @student.save

    redirect_to student_path(@student)
    #in rails, it's "redirect_to", not 'redirect to' (use the underscore!)
  end
  private

    def set_student
      @student = Student.find(params[:id])
    end
end
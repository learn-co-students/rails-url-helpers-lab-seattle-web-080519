class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @active = "This student is currently inactive." if !@student.active
    @active = "This student is currently active." if @student.active
  end

  def activate
    @student = Student.find(params[:id])
    if @student.active == true
      @student.active = false
    else
        @student.active = true
    end
    @student.save
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
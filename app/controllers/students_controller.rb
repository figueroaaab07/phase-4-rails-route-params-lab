class StudentsController < ApplicationController

  def index
    # students = Student.all
    # render json: students

    students = (params[:name] == nil) ?
      Student.all
      :
      Student.all.filter{|s| s.last_name == params[:name].capitalize() || s.first_name == params[:name].capitalize()}
    render json: students
  end

  def grades
    # model
    grades = Student.all.order(grade: :desc)
    #view
    render json: grades
  end

  def highest_grade
    # model
    highest_grade = Student.all.order(grade: :desc).first
    render json: highest_grade
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade)
  end

end

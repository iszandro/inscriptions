# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_teacher!, except: %i[index]
  before_action :find_course, only: %i[edit update]

  def index
    @courses = Course.includes(:created_by).all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params.merge(created_by: current_teacher))

    if @course.save
      redirect_to root_path, notice: 'Course created!'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to root_path, notice: 'Course updated!'
    else
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

  def find_course
    @course = current_teacher.created_courses.find_by(id: params[:id])

    redirect_to root_path unless @course
  end
end

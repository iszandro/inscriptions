# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_teacher!, only: %i[new create]

  def index
    @courses = Course.includes(:created_by).all
  end

  def new
    @course = Course.new(created_by: current_teacher)
  end

  def create
    @course = Course.new(course_params.merge(created_by: current_teacher))

    if @course.save
      redirect_to root_path, notice: 'Course created!'
    else
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end

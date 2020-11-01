# frozen_string_literal: true

class InscriptionsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :find_course

  def create
    if @course.inscriptions.create(teacher: current_teacher)
      head :created
    else
      head :unprocessable_entity
    end
  end

  def destroy
    inscription = @course.inscriptions.find_by(id: params[:id])

    if inscription&.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def find_course
    @course = Course.find_by(id: params[:course_id])

    redirect_to root_path unless @course
  end
end

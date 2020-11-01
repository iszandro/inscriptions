# frozen_string_literal: true

class InscriptionsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :find_course

  def create
    inscription = @course.inscriptions.build(teacher: current_teacher)
    if inscription.save
      redirect_to course_path(@course), notice: 'Inscription created'
    else
      redirect_to course_path(@course), notice: 'Cannot create inscription'
    end
  end

  def destroy
    inscription = @course.inscriptions.find_by(id: params[:id])

    if inscription&.destroy
      redirect_to course_path(@course), notice: 'Inscription cancelled'
    else
      redirect_to course_path(@course), notice: 'Cannot cancel inscription'
    end
  end

  private

  def find_course
    @course = Course.find_by(id: params[:course_id])

    redirect_to root_path unless @course
  end
end

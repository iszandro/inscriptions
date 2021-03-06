# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authenticate_teacher!
  before_action :find_voteable

  def create
    @voteable.votes.create(voter: current_teacher)
    render 'votes/counter_update'
  end

  def destroy
    vote = @voteable.votes.find_by(id: params[:id])
    vote&.destroy
    render 'votes/counter_update'
  end

  private

  def find_voteable
    @voteable = if params[:course_id]
                  Course.find_by(id: params[:course_id])
                else
                  Teacher.find_by(id: params[:teacher_id])
                end

    redirect_to root_path unless @voteable
  end
end

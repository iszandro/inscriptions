# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_teacher!

  def update
    if current_teacher.update(profile_params)
      redirect_to profile_path, notice: 'Profile updated'
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :skills)
      .merge(skills: Array(params.dig(:teacher, :skills)&.split(',')))
  end
end

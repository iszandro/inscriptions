# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.includes(:created_by).all
  end
end

# frozen_string_literal: true

module TeachersHelper
  def teacher_container_class
    params[:action] == 'index' && 'column' || 'mt-5'
  end
end

# frozen_string_literal: true

require 'test_helper'

class UpdateCourseTest < ActionDispatch::IntegrationTest
  def setup
    @teacher = teachers(:snape)
    sign_in @teacher
  end

  test 'teacher cannot update course from another teacher' do
    course = courses(:fly)
    put course_path(course), params: { course: { name: 'Another Course' } }
    refute_equal 'Another Course', course.name
  end
end

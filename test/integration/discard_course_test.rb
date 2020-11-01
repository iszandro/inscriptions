# frozen_string_literal: true

require 'test_helper'

class DiscardCourseTest < ActionDispatch::IntegrationTest
  def setup
    @teacher = teachers(:snape)
    @course = courses(:potions)
    sign_in @teacher
  end

  test 'guest user cannot discard a course' do
    sign_out @teacher
    assert_no_difference 'Course.count' do
      delete course_path(@course)
    end
  end

  test 'teacher can discard his course' do
    assert_difference -> { Course.count } => -1 do
      delete course_path(@course)
    end
  end

  test 'teacher cannot discard course from another teacher' do
    assert_no_difference 'Course.count' do
      delete course_path(courses(:fly))
    end
  end
end

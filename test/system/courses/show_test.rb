# frozen_string_literal: true

require 'application_system_test_case'

module Courses
  class ShowTest < ApplicationSystemTestCase
    def setup
      @teacher = teachers(:snape)
      @course = courses(:potions)
      sign_in @teacher
    end

    test 'guest user can see a course' do
      sign_out @teacher
      visit course_path(@course)
      assert_current_path course_path(@course)
      refute_css '.fas.fa-trash'
    end

    test 'teacher can see his course' do
      visit course_path(@course)
      assert_current_path course_path(@course)
      assert_css '.fas.fa-trash'
    end

    test 'teacher can see course from another teacher' do
      course = courses(:fly)
      visit course_path(course)
      assert_current_path course_path(course)
      refute_css '.fas.fa-trash'
    end
  end
end

# frozen_string_literal: true

require 'application_system_test_case'

module Courses
  class DeleteTest < ApplicationSystemTestCase
    def setup
      @teacher = teachers(:snape)
      @course = courses(:potions)
      sign_in @teacher
    end

    test 'guest user cannot remove a course' do
      sign_out @teacher
      visit course_path(@course)
      assert_current_path course_path(@course)
      refute_match /Remove Course/, page.body
    end

    test 'teacher can see his course' do
      visit course_path(@course)

      assert_current_path course_path(@course)
      assert_difference -> { Course.count } => -1 do
        click_on 'Remove Course'
      end
    end

    test 'teacher cannot remove a course from another teacher' do
      course = courses(:fly)
      visit course_path(course)
      assert_current_path course_path(course)
      refute_match /Remove Course/, page.body
    end
  end
end

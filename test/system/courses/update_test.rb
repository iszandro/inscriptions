# frozen_string_literal: true

require 'application_system_test_case'

module Courses
  class UpdateTest < ApplicationSystemTestCase
    def setup
      @teacher = teachers(:snape)
      @course = courses(:potions)
      sign_in @teacher
    end

    test 'guest user cannot update a course' do
      sign_out @teacher
      visit edit_course_path(@course)
      assert_current_path new_teacher_session_path
    end

    test 'teacher can update his course' do
      visit edit_course_path(@course)
      assert_content 'Edit course'

      fill_in 'Name', with: 'Potions 2'
      fill_in 'Description', with: 'Beginner level course'

      assert_no_difference 'Course.count' do
        click_on 'Update Course'
      end

      assert_equal 'Potions 2', @course.reload.name
      assert_equal 'Beginner level course', @course.description
      assert_equal @teacher, @course.created_by
      assert @course.active?
    end

    test 'teacher cannot update course from another teacher' do
      course = courses(:fly)
      visit edit_course_path(course)
      assert_current_path root_path
    end
  end
end

# frozen_string_literal: true

module Courses
  class CreateTest < ApplicationSystemTestCase
    def setup
      @teacher = teachers(:snape)
      sign_in @teacher
    end

    test 'guest user cannot create a course' do
      sign_out @teacher
      visit new_course_path
      assert_current_path new_teacher_session_path
    end

    test 'teacher can create a course' do
      visit new_course_path
      assert_content 'New course'

      fill_in 'Name', with: 'Potions 1'
      fill_in 'Description', with: 'Beginner level course'

      assert_difference 'Course.count' do
        click_on 'Create Course'
      end

      course = Course.last
      assert_equal 'Potions 1', course.name
      assert_equal 'Beginner level course', course.description
      assert_equal @teacher, course.created_by
      assert course.pending?
    end

    test 'teacher cannot create an invalid course' do
      visit new_course_path
      assert_content 'New course'

      assert_no_difference 'Course.count' do
        click_on 'Create Course'
      end
      assert_content "Name can't be blank"
    end
  end
end

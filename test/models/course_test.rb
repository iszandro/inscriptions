# frozen_string_literal: true

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'validations' do
    course = courses(:potions)
    new_course = Course.new

    refute new_course.valid?
    assert_equal ["can't be blank"], new_course.errors.messages[:name]
    assert_equal ['must exist'], new_course.errors.messages[:created_by]

    new_course.name = 'Potions 1'
    new_course.created_by = teachers(:snape)

    assert new_course.valid?

    new_course.name = course.name

    refute new_course.valid?
    assert_equal ['has already been taken'], new_course.errors.messages[:name]
  end

  test 'creating a course automatically enrolls the teacher' do
    teacher = teachers(:snape)
    course = Course.create(name: 'Test', created_by: teacher)

    assert_equal 1, course.inscriptions.count

    inscription = course.inscriptions.first
    assert_equal teacher, inscription.teacher
  end
end

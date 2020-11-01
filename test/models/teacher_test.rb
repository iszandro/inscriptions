# frozen_string_literal: true

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  test 'validations' do
    teacher = Teacher.new

    refute teacher.valid?
    assert_equal ["can't be blank"], teacher.errors.messages[:first_name]
    assert_equal ["can't be blank"], teacher.errors.messages[:last_name]
    assert_equal ["can't be blank"], teacher.errors.messages[:email]
    assert_equal ["can't be blank"], teacher.errors.messages[:password]

    teacher.first_name = 'Bruce'
    teacher.last_name = 'Wayne'
    teacher.email = 'bruce@wayne.com'
    teacher.password = 'batman'

    assert teacher.valid?
  end

  test '#name' do
    teacher = teachers(:snape)
    assert_equal 'Severus Snape', teacher.name
  end
end

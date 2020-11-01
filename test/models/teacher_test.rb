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

  test '#inscription_from' do
    teacher = teachers(:snape)

    assert_equal inscriptions(:snape_potions), teacher.inscription_from(courses(:potions))
    assert_nil teacher.inscription_from(courses(:fly))
  end

  test '#name' do
    teacher = teachers(:snape)
    assert_equal 'Severus Snape', teacher.name
  end

  test '#vote_from' do
    teacher = teachers(:snape)

    assert_equal votes(:snape_vote_snape_teacher), teacher.vote_from(teacher)
    assert_equal votes(:snape_vote_potions_course), teacher.vote_from(courses(:potions))
    assert_nil teacher.vote_from(teachers(:rolanda))
    assert_nil teacher.vote_from(courses(:fly))
  end
end

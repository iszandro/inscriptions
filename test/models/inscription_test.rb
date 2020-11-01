# frozen_string_literal: true

require 'test_helper'

class InscriptionTest < ActiveSupport::TestCase
  test 'validations' do
    inscription = Inscription.new

    refute inscription.valid?
    assert_equal ['must exist'], inscription.errors.messages[:teacher]
    assert_equal ['must exist'], inscription.errors.messages[:course]

    teacher = teachers(:snape)
    course = courses(:fly)

    inscription.teacher = teacher
    inscription.course = course

    assert inscription.valid?
  end
end

# frozen_string_literal: true

require 'test_helper'

class IntegrationsFlowTest < ActionDispatch::IntegrationTest
  def setup
    @teacher = teachers(:snape)
    @course = courses(:fly)

    sign_in @teacher
  end

  test 'teacher can enroll to a course' do
    assert_difference 'Inscription.count' do
      post course_inscriptions_path(@course)
    end
    assert_response 201
  end

  test 'teacher can remove enrollment from a course' do
    inscription = @course.inscriptions.create(teacher: @teacher)

    assert_difference -> { Inscription.count } => -1 do
      delete course_inscription_path(@course, inscription)
    end
    assert_response 200
  end
end

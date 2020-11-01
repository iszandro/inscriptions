# frozen_string_literal: true

require 'application_system_test_case'

module Inscriptions
  class DeleteTest < ApplicationSystemTestCase
    driven_by :selenium, using: :headless_chrome

    def setup
      @teacher = teachers(:snape)
      @course = courses(:fly)
      sign_in @teacher
    end

    test 'teacher can leave a course to not teach it' do
      @course.inscriptions.create(teacher: @teacher)
      visit course_path(@course)

      assert_content 'Leave'
      assert_difference -> { Inscription.count } => -1 do
        find('.fas.fa-minus-circle').click
      end
      assert_content 'Inscription cancelled'
      assert_css '.fas.fa-plus'
      refute_css '.fas.fa-minus-circle'
      assert_content 'Enroll'
      refute_content 'Leave'
      refute_content @teacher.email
    end
  end
end

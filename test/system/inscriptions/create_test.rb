# frozen_string_literal: true

require 'application_system_test_case'

module Inscriptions
  class CreateTest < ApplicationSystemTestCase
    driven_by :selenium, using: :headless_chrome

    def setup
      @teacher = teachers(:snape)
      @course = courses(:fly)
      sign_in @teacher
    end

    test 'guest user cannot create inscription' do
      sign_out @teacher
      visit course_path(@course)
      assert_current_path course_path(@course)
      refute_css '.fas.fa-plus'
      refute_css '.fas.fa-minus-circle'
      refute_content 'Enroll'
      refute_content 'Leave'
    end

    test 'teacher can enroll to a course to teach it' do
      visit course_path(@course)

      assert_content 'Enroll'
      assert_difference 'Inscription.count' do
        find('.fas.fa-plus').click
      end
      assert_content 'Inscription created'
      refute_css '.fas.fa-plus'
      assert_css '.fas.fa-minus-circle'
      refute_content 'Enroll'
      assert_content 'Leave'
    end

    test 'teacher cannot enroll to his course' do
      visit course_path(courses(:potions))

      assert_content @teacher.email
      refute_css '.fas.fa-plus'
      refute_css '.fas.fa-minus-circle'
      refute_content 'Enroll'
      refute_content 'Leave'
    end
  end
end

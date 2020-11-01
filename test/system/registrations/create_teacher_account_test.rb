# frozen_string_literal: true

require 'application_system_test_case'

module Registrations
  class CreateTeacherAccountTest < ApplicationSystemTestCase
    test 'create teacher account' do
      visit new_teacher_registration_path
      assert_content 'Sign up'

      fill_in 'First name', with: 'Bruce'
      fill_in 'Last name', with: 'Wayne'
      fill_in 'Email', with: 'bruce@wayne.com'
      fill_in 'Password', with: 'batman'
      fill_in 'Password confirmation', with: 'batman'

      assert_difference 'Teacher.count' do
        within('form') { click_on 'Sign up' }
        assert_current_path root_path
      end

      teacher = Teacher.last
      assert_equal 'Bruce', teacher.first_name
      assert_equal 'Wayne', teacher.last_name
      assert_equal 'bruce@wayne.com', teacher.email
    end
  end
end

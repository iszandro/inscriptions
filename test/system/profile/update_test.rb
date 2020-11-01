# frozen_string_literal: true

require 'application_system_test_case'

module Profile
  class UpdateTest < ApplicationSystemTestCase
    test 'guest user cannot access to profile' do
      visit profile_path
      assert_content 'You need to sign in or sign up before continuing.'
      assert_current_path new_teacher_session_path
    end

    test 'teacher can update his profile' do
      teacher = teachers(:snape)

      sign_in teacher
      visit profile_path

      fill_in 'First name', with: 'Half-Blood'
      fill_in 'Last name', with: 'Prince'
      fill_in 'Email', with: 'half-blood@prince.com'
      fill_in 'Skills', with: 'Magic,Transformations,Spells,Potions,Dark Magic'

      click_on 'Update'

      assert_content 'Profile updated'
      assert_equal 'Half-Blood', teacher.reload.first_name
      assert_equal 'Prince', teacher.last_name
      assert_equal 'half-blood@prince.com', teacher.email
      assert_equal ['Magic', 'Transformations', 'Spells', 'Potions', 'Dark Magic'], teacher.skills
    end
  end
end

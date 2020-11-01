# frozen_string_literal: true

require 'application_system_test_case'

module Courses
  class IndexTest < ApplicationSystemTestCase
    def setup
      @course = courses(:potions)
    end

    test 'guest user can see courses' do
      visit root_path

      assert_content @course.name
      assert_content @course.created_by.name
      assert_content @course.description
    end

    test 'signed teacher can see courses' do
      sign_in teachers(:snape)
      visit root_path

      assert_content @course.name
      assert_content @course.created_by.name
      assert_content @course.description
    end
  end
end

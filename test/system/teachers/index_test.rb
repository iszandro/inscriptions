# frozen_string_literal: true

require 'application_system_test_case'

module Teachers
  class IndexText < ApplicationSystemTestCase
    test 'guest user can see teachers' do
      visit teachers_path

      assert_content 'Teachers'
      assert_content 'Severus Snape'
      assert_content 'Rolanda Hooch'
      assert_content 'Magic'
      assert_content 'Potions'
      assert_content 'Fly'
      assert_content 'Quidditch'

      refute_css '.fas.fa-heart'
      refute_css '.far.fa-heart'
    end

    test 'teacher can see all teachers' do
      teacher = teachers(:snape)
      sign_in teacher

      visit teachers_path

      assert_content 'Teachers'
      assert_content 'Severus Snape'
      assert_content 'Rolanda Hooch'
      assert_content 'Magic'
      assert_content 'Potions'
      assert_content 'Fly'
      assert_content 'Quidditch'

      assert_css '.fas.fa-heart'
      assert_css '.far.fa-heart'
    end
  end
end

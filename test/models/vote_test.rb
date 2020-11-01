# frozen_string_literal: true

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'validations' do
    teacher = teachers(:snape)
    course = courses(:fly)

    vote = Vote.new

    refute vote.valid?
    assert_equal ['must exist'], vote.errors.messages[:voter]
    assert_equal ['must exist'], vote.errors.messages[:voteable]

    vote.voter = teacher
    vote.voteable = course

    assert vote.valid?

    vote.voteable = courses(:potions)

    refute vote.valid?
    assert_equal ['has already been taken'], vote.errors.messages[:voteable_id]
  end

  test 'voter count for teachers' do
    teacher = teachers(:rolanda)
    assert teacher.votes.size.zero?

    teacher.votes.create(voter: teacher)
    assert_equal 1, teacher.votes.size
  end

  test 'voter count for courses' do
    teacher = teachers(:rolanda)
    course = courses(:fly)

    assert course.votes.size.zero?

    course.votes.create(voter: teacher)
    assert_equal 1, course.votes.size
  end
end

# frozen_string_literal: true

require 'test_helper'

class VotesFlowTest < ActionDispatch::IntegrationTest
  test 'teacher can vote a teacher' do
    voter = teachers(:snape)
    teacher = teachers(:rolanda)

    sign_in voter
    assert_difference 'Vote.count' do
      post teacher_votes_path(teacher)
    end
    assert_equal({ votes: 1 }, JSON.parse(response.body, symbolize_names: true))
  end

  test 'teacher can vote a course' do
    voter = teachers(:snape)
    course = courses(:fly)

    sign_in voter
    assert_difference 'Vote.count' do
      post course_votes_path(course)
    end
    assert_equal({ votes: 1 }, JSON.parse(response.body, symbolize_names: true))
  end

  test 'teacher can remove vote from a teacher' do
    voter = teachers(:snape)
    teacher = teachers(:rolanda)

    sign_in voter

    vote = teacher.votes.create(voter: voter)
    assert_difference -> { Vote.count } => -1 do
      delete teacher_vote_path(teacher, vote)
    end
    assert_equal({ votes: 0 }, JSON.parse(response.body, symbolize_names: true))
  end

  test 'teacher can remove vote from a course' do
    voter = teachers(:snape)
    course = courses(:fly)

    sign_in voter

    vote = course.votes.create(voter: voter)
    assert_difference -> { Vote.count } => -1 do
      delete course_vote_path(course, vote)
    end
    assert_equal({ votes: 0 }, JSON.parse(response.body, symbolize_names: true))
  end

  test 'teacher tries to remove a vote from a teacher' do
    voter = teachers(:snape)
    teacher = teachers(:rolanda)

    sign_in voter

    assert_difference -> { Vote.count } => 0 do
      delete teacher_vote_path(teacher, -1)
    end
    assert_equal({ votes: 0 }, JSON.parse(response.body, symbolize_names: true))
  end

  test 'teacher tries to remove a vote from a course' do
    voter = teachers(:snape)
    course = courses(:fly)

    sign_in voter

    assert_difference -> { Vote.count } => 0 do
      delete course_vote_path(course, -1)
    end
    assert_equal({ votes: 0 }, JSON.parse(response.body, symbolize_names: true))
  end
end

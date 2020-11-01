# frozen_string_literal: true

class AddVotesToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :votes_count, :integer, default: 0
  end
end

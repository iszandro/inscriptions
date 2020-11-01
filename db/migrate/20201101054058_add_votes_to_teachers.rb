# frozen_string_literal: true

class AddVotesToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :votes, :integer, default: 0
  end
end

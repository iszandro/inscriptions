# frozen_string_literal: true

class AddInscriptionsCountToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :inscriptions_count, :integer, default: 0
  end
end

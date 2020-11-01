# frozen_string_literal: true

class AddInscriptionsCountToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :inscriptions_count, :integer, default: 0
  end
end

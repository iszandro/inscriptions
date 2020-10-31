# frozen_string_literal: true

class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :skills, array: true, default: []

      t.timestamps
    end
  end
end

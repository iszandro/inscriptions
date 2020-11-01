# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name, index: { unique: true }
      t.text :description
      t.belongs_to :created_by, foreign_key: { to_table: :teachers }, index: true, null: false
      t.integer :status, default: 0, limit: 1

      t.timestamps
    end
  end
end

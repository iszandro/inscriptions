# frozen_string_literal: true

class CreateInscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :inscriptions do |t|
      t.belongs_to :teacher, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end

    add_index :inscriptions, %i[teacher_id course_id], unique: true
  end
end

# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.belongs_to :voter, foreign_key: { to_table: :teachers }
      t.belongs_to :voteable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :votes, %i[voter_id voteable_id voteable_type], unique: true
  end
end

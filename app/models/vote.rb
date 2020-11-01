# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :voter, class_name: 'Teacher'
  belongs_to :voteable, polymorphic: true, counter_cache: :votes_count

  validates_uniqueness_of :voteable_id, scope: %i[voteable_type voter_id]
end

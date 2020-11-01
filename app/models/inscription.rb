# frozen_string_literal: true

class Inscription < ApplicationRecord
  belongs_to :teacher, counter_cache: true
  belongs_to :course, counter_cache: true
end

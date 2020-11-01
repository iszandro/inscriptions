# frozen_string_literal: true

class Inscription < ApplicationRecord
  belongs_to :teacher
  belongs_to :course
end

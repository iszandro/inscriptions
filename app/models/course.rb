# frozen_string_literal: true

class Course < ApplicationRecord
  include Discard::Model

  default_scope -> { kept }

  belongs_to :created_by, class_name: 'Teacher'

  validates :name, presence: true, uniqueness: true

  enum status: %i[pending active]
end

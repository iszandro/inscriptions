# frozen_string_literal: true

class Course < ApplicationRecord
  include Discard::Model

  default_scope -> { kept }

  belongs_to :created_by, class_name: 'Teacher'
  has_many :inscriptions
  has_many :teachers, through: :inscriptions
  has_many :votes, as: :voteable

  validates :name, presence: true, uniqueness: true

  enum status: %i[pending active]

  after_create :enroll_course

  def class_name
    :course
  end

  private

  def enroll_course
    inscriptions.create(teacher: created_by)
  end
end

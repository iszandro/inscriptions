# frozen_string_literal: true

class Teacher < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :created_courses, class_name: 'Course', foreign_key: :created_by_id

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end

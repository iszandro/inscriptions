# frozen_string_literal: true

class Teacher < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :courses, class_name: 'Course', foreign_key: :created_by_id
  has_many :inscriptions
  has_many :enrolled_courses, through: :inscriptions, source: :course
  has_many :votes, as: :voteable

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def vote_from(voteable)
    voteable.votes.find_by(voter: self)
  end
end

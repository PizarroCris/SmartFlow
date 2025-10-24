class FocusSession < ApplicationRecord
  belongs_to :user
  belongs_to :task, optional: true

  validates :title, presence: true
  validates :duration_minutes, presence: true
  validates :duration_minutes, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  enum status: { completed: 0, interrupted: 1 }
end

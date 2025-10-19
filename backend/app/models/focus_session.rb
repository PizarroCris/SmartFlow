class FocusSession < ApplicationRecord
  belongs_to :user
  belongs_to :task, optional: true

  validates :title, presence: true
  validates :duration_minutes, presence: true

  enum status: { completed: 0, interrupted: 1 }
end

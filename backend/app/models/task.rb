class Task < ApplicationRecord
  belongs_to :user
  belongs_to :weekly_goal, optional: true

  validates :title, presence: true
  enum status: { incomplete: 0, completed: 1 }
  enum priority: { low: 0, medium: 1, high: 2 }
end

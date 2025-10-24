class WeeklyGoal < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, presence: true
  validates :description, length: { maximum: 1200 }
end
class WeeklyGoalPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def show?
    record.user_id == user.id
  end

  def update?
    record.user_id == user.id
  end
end

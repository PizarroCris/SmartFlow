class WeeklyGoalPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def show?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner? 
  end

  private
  
  def owner?
    record.user_id == user.id 
  end
end

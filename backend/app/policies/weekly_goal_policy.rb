class WeeklyGoalPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    user.present? 
  end
  
  def index?
    user.present?
  end

end

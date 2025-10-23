class Api::V1::WeeklyGoalsController < Api::V1::BaseController
  before_action :set_weekly_goal, only: [:show, :update, :destroy]

  def index
    @weekly_goals = policy_scope(WeeklyGoal)
    render :index, status: :ok
  end

  def show
    render :show, status: :ok
  end

  def create
    @weekly_goal = current_user.weekly_goals.build(weekly_goal_params)
    authorize @weekly_goal
    if @weekly_goal.save
      render :show, status: :created
    else
      render json: { errors: @weekly_goal.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @weekly_goal.update(weekly_goal_params)
      render :show, status: :ok
    else
      render json: { errors: @weekly_goal.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @weekly_goal.destroy
    head :no_content
  end

  private

  def set_weekly_goal
    @weekly_goal = current_user.weekly_goals.find(params[:id])
    authorize @weekly_goal
  rescue ActiveRecord::RecordNotFound
    raise Pundit::NotAuthorizedError
  end

  def weekly_goal_params
    params.require(:weekly_goal).permit(:title, :description, :target_date)
  end
end
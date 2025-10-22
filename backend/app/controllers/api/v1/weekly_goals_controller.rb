module Api
  module V1
    class WeeklyGoalsController < ApplicationController
      before_action :authenticate_user!

      def index
        @weekly_goals = WeeklyGoal.where(user: current_user)
        render json: @weekly_goals
      end

      def show
        @weekly_goal = current_user.weekly_goals.find(params[:id])
        authorize @weekly_goal
        render json: @weekly_goal
      end

      def create
        @weekly_goal = current_user.weekly_goals.build(weekly_goal_params)
        authorize @weekly_goal
        if @weekly_goal.save
          render json: @weekly_goal, status: :created
        else
          render json: { errors: @weekly_goal.errors }, status: :unprocessable_entity
        end
      end

      def update
        @weekly_goal = current_user.weekly_goals.find(params[:id])
        authorize @weekly_goal
        if @weekly_goal.update(weekly_goal_params)
          render json: @weekly_goal, status: :ok 
        else
          render json: { errors: @weekly_goal.errors }, status: :unprocessable_entity
        end
      end

      def destroy

        @weekly_goal = current_user.weekly_goals.find(params[:id])


        authorize @weekly_goal

        @weekly_goal.destroy

        head :no_content
      end

      private
      
      def weekly_goal_params
        params.require(:weekly_goal).permit(:title, :description, :target_date)
      end
    end
  end
end

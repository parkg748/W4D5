class GoalsController < ApplicationController
  before_action :not_users_page, only: [:show, :edit]
  
  def index
    @goals = Goal.all
    @goal = Goal.find(params[:id])
    render :index
  end
  
  def new
    @goal = Goal.new
    render :new
  end
  
  def edit
    @goal = current_user.goals.find(params[:id])
    render :edit
  end
  
  def show
    @goal = Goal.find(params[:id])
    render :show
  end
  
  def update
    @goal = current_user.goals.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy
    redirect_to goals_url
  end
  
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to(goal_url(@goal))
    else
      flash.now[:errors] = @goals.errors.full_messages
      render :new
    end
  end
  
  private
  def goal_params
    params.require(:goal).permit(:list_of_goal)
  end
  
  def not_users_page
    unless current_user.goal_ids.include?(params[:id].to_i)
      flash[:errors] = ["You cannnot access the goals if another user."]
      redirect_to user_url(current_user)
    end
  end
end
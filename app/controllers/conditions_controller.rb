class ConditionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @condition = Condition.new
    @imaging = Imaging.find(params[:imaging_id])
  end
  
  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to imaging_path(params[:imaging_id])
    else
      @imaging = @condition.imagings
      @conditions = @imaging.conditions.includes(:user)
      redirect_to imaging_path(@condition.imaging)
    end
  end

  def show
    @user = User.find(params[:id])
    @imaging = Imaging.find(params[:id])
    @condition = Condition.new
    @conditions = @imaging.conditions.includes(:user)
  end

  def edit
  end

  def update
  end

  def destroy
    if @condition.user.occupation == current_user.occupation
        @condition.destroy 
        redirect_to imaging_condition_path
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:location_id, :contrast_id, :suppression_id, :enhance_id, :remarks).merge(user_id: current_user.id, imaging_id: params[:imaging_id])
  end


end

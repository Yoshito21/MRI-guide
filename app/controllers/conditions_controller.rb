class ConditionsController < ApplicationController
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

  private

  def condition_params
    params.require(:condition).permit(:location_id, :contrast_id, :suppression_id, :enhance_id, :remarks).merge(user_id: current_user.id, imaging_id: params[:imaging_id])
  end
end

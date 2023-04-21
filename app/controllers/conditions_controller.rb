class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
    @imaging = Imaging.new
    @imagings = @condition.imagings.includes(:user)
  end
  
  def create
    @condition = current_user.conditions.build(condition_params)
    @imagings = @condition.imagings.includes(:user)
    if @condition.save
      redirect_to imaging_path(@condition.imaging)
    else
      render :new
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:location_id, :contrast_id, :suppression_id, :enhance_id, :remarks).merge(imaging_id: params[:imaging_id])
  end
end

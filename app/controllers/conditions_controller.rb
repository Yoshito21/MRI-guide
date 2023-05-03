class ConditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_condition, only: [:destroy]

  def new
    @condition = Condition.new
    @occupation = Occupation.new
    @imaging = Imaging.find(params[:imaging_id])
  end
  
  def create
    @condition = Condition.new(condition_params)
    @condition.occupation_id = current_user.occupation_id
    if @condition.save
      redirect_to imaging_path(params[:imaging_id])
    else
      @imaging = @condition.imaging
      @conditions = @imaging.conditions.includes(:occupation)
      redirect_to imaging_path(@condition.imaging)
    end
  end

  def show
    @imaging = Imaging.find(params[:id])
    @occupation = Occupation.new
    @condition = Condition.new
    @conditions = @imaging.conditions.includes(:occupation)
  end

  def edit
  end

  def update
  end

  def destroy
    if @condition.occupation_id == current_user.occupation.id
        @condition.destroy 
        redirect_to imaging_condition_path
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:location_id, :contrast_id, :suppression_id, :enhance_id, :remarks).merge(imaging_id: params[:imaging_id])
  end

  def set_condition
    @condition = Condition.find_by(id: params[:id])
  end

end

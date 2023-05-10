class ConditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_condition, only: [:destroy]

  def new
    @condition = Condition.new
    @occupation = Occupation.new
    @imaging = Imaging.find(params[:imaging_id])
  end
  
  def create
    @imaging = Imaging.find(params[:imaging_id])
    @occupation = Occupation.find(params[:occupation_id])
    @condition = @imaging.conditions.build(condition_params)
    @condition.occupation_id = @occupation.id
    if @condition.save
      redirect_to imaging_path(@imaging, occupation_id: @occupation.id), notice: '条件を追加しました'
    else
      render template:"imagings/show"
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
    @imaging = Imaging.find(params[:imaging_id])
    @occupation = current_user.occupation
    if @imaging.conditions.where(id: params[:condition_ids]).destroy_all
      redirect_to imaging_path(imaging_id: @imaging.id, occupation_id: @occupation.id), notice: "選択された条件を削除しました。"
    else
      redirect_to imaging_path(imaging_id: @imaging.id, occupation_id: @occupation.id), alert: "条件の削除に失敗しました。"
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:location_id, :contrast_id, :suppression_id, :enhance_id, :remarks, :ids => []).merge(imaging_id: params[:imaging_id])
  end

  def set_condition
    @condition = Condition.find_by(id: params[:id])
  end

end

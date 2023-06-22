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
    @occupation = current_user.occupation
    contrast_ids = params[:condition][:contrast_ids].reject(&:blank?)
  
    if contrast_ids.present?
      # contrast_ids に含まれる contrast_id の組み合わせごとに Condition オブジェクトを作成
      conditions = contrast_ids.map do |contrast_id|
        @imaging.conditions.build(
          location_id: params[:condition][:location_id],
          suppression_id: params[:condition][:suppression_id],
          enhance_id: params[:condition][:enhance_id],
          contrast_id: contrast_id,
          occupation_id: @occupation.id
        )
      end
  
      if conditions.all?(&:valid?)
        # すべての Condition オブジェクトがバリデーションを通過すれば、保存
        conditions.each(&:save)
        redirect_to imaging_path(@imaging, occupation_id: @occupation.id), notice: '条件を追加しました'
      else
        # バリデーションエラーがある場合は、エラーメッセージを表示する
        flash.now[:alert] = '条件の追加に失敗しました'
        render template: 'imagings/show'
      end
    else
      # contrast_id が選択されていない場合は、エラーメッセージを表示する
      flash.now[:alert] = '撮影法を選択してください'
      render template: 'imagings/show'
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
    params.require(:condition).permit(:location_id, :contrast_id, :suppression_id, :enhance_id, :ids => [], contrast_ids: []).merge(imaging_id: params[:imaging_id])
  end

  def set_condition
    @condition = Condition.find_by(id: params[:id])
  end

end

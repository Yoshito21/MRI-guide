class ImagingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_imaging, only: [:show, :edit, :update, :destroy]
  
  def index
    @imagings = Imaging.all
  end
    
  def new
    @imaging = Imaging.new
  end

  def create
    current_user.imagings.new(imaging_params)
    if current_user.save
      redirect_to imaging_path(current_user.id)
    else
      render :new
    end
  end

  def show
    Condition.new
    @conditions = @imaging.conditions.includes(:user)
    if @conditions.present?
      @condition = Condition.find(params[:id])
    end
  end

  def edit
  end

  def update
    if @imaging.update(imaging_params)
      redirect_to imaging_path(@imaging.id)
    else
      render :edit
    end
  end

  def destroy
      if @imaging.user.occupation == current_user.occupation
          @imaging.destroy 
          redirect_to root_path
      end
  end

  def search
    # params[:q]がnilではない且つ、params[:q][:name]がnilではないとき（商品名の欄が入力されているとき）
    # if params[:q] && params[:q][:name]と同じような意味合い
    if params[:q]&.dig(:name)
      # squishメソッドで余分なスペースを削除する
      squished_keywords = params[:q][:name].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:name_cont_any] = squished_keywords.split(" ")
    end
    @q = Imaging.ransack(params[:q])
    @imagings = @q.result
  end

  private
  def imaging_params
    params.require(:imaging).permit(:site_id, :purpose, :indentification, :symptoms, :treatment, user_ids:[])
  end

  def set_imaging
    @imaging = Imaging.find(params[:id])
  end

end

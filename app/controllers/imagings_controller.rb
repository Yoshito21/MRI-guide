class ImagingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_imaging, only: [:edit, :update, :destroy]
  
  def index
    @imagings = Imaging.all
  end
    
  def new
    @imaging = Imaging.new
  end

  def create
    @imaging = Imaging.new(imaging_params)
    if @imaging.save
      redirect_to imaging_path(@imaging, occupation_id: current_user.occupation.id)
    else
      render :new
    end
  end

  def show
    @occupation_id = params[:occupation_id]
    @users = User.where(occupation_id: @occupation_id)
    @imaging = Imaging.find(params[:id])
    @condition = @imaging.conditions.build
    @occupation = Occupation.find_by(id: @occupation_id) || Occupation.find_by(name: "未登録")
    @occupations = Occupation.includes(:conditions).where(conditions: {imaging_id: @imaging.id}) || Occupation.find_by(name: "未登録")
  end

  def edit
    @occupation = current_user.occupation
  end

  def update
    if @imaging.update(imaging_params)
      redirect_to imaging_path(@imaging, occupation_id: current_user.occupation.id)
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
    if params[:q]&.dig(:name)
      # squishメソッドで余分なスペースを削除する
      squished_keywords = params[:q][:name].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:name_cont_any] = squished_keywords.split(" ")
    end
    @q = Imaging.ransack(params[:q])
    @imagings = @q.result
    @occupation = current_user.occupation || Occupation.find_by(name: "未登録")
  end

  private
  def imaging_params
    params.require(:imaging).permit(:site_id, :purpose, :indentification, :symptoms, :treatment)
  end

  def set_imaging
    @imaging = Imaging.find(params[:id])
  end

end

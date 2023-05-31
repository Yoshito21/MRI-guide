class ImagingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_imaging, only: [:edit, :update, :destroy]
  before_action :set_search, only: [:new, :edit]
  before_action :set_search_contrast, only: :show

  def new  
    if current_user.occupation.id == 2
      redirect_to imaging_path(@imaging)
    else
      @occupation = current_user.occupation
      @imaging = Imaging.new
    end
  end
  

  def create
    @imaging = Imaging.new(imaging_params)
    if @imaging.save
    flash[:success] = "新規登録が完了しました。"
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
    if current_user.occupation.present?
      @occupation = current_user.occupation
    else
      redirect_to imaging_path(@imaging)
    end
  end

  def update
    @occupation = current_user.occupation
    height_ids = params[:imaging][:height_ids] || [] 
    middle_ids = params[:imaging][:middle_ids] || [] 
    height_ids = params[:imaging][:low_ids] || [] 
    @imaging.height_ids = params[:imaging][:height_ids]
    @imaging.middle_ids = params[:imaging][:middle_ids]
    @imaging.low_ids = params[:imaging][:low_ids]
    if @imaging.update(imaging_params)
      redirect_to imaging_path(@imaging, occupation_id: current_user.occupation.id)
    else
      render :edit
    end
  end

  def destroy
    @imaging.destroy 
    redirect_to root_path
  end

  def search
    if params[:q]&.dig(:purpose_cont)
      squished_keywords = params[:q][:purpose_cont].squish
      params[:q][:purpose_cont_cont_any] = squished_keywords.split(" ")
    end
    @q = Imaging.ransack(params[:q])
    session[:search_params] = params[:q]
    @imagings = @q.result(distinct: true).limit(10)
    @occupation = current_user.occupation || Occupation.find_by(name: "未登録")
    
    respond_to do |format|
      format.html
      format.json { render json: @imagings }
    end
  end

  private
  def imaging_params
    params.require(:imaging).permit(:site_id, :purpose, :indentification, :symptoms, :treatment, height_ids: [], middle_ids: [], low_ids: [])
  end

  def set_imaging
    @imaging = Imaging.find(params[:id])
  end

  def set_search
    if params[:q]&.dig(:purpose_cont)
      squished_keywords = params[:q][:purpose_cont].squish
      params[:q][:purpose_cont_cont_any] = squished_keywords.split(" ")
    end
  
    session[:search_params] ||= { site_id_eq: nil, purpose_cont: nil }
    session[:search_params].merge!(params[:q]) if params[:q].present?
    @q = Imaging.ransack(session[:search_params])
    @imagings = @q.result(distinct: true).limit(10)
  
    respond_to do |format|
      format.html
      format.json { render json: @imagings }
    end
  end


  def set_search_contrast
    @occupation_id = params[:occupation_id]
    @search_occupation = Occupation.find_by(id: @occupation_id)
    @heights = Height.all
    @middles = Middle.all
    @lows = Low.all

    height_ids = params[:height_ids] || []
    middle_ids = params[:middle_ids] || []
    low_ids = params[:low_ids] || []

    @search_imagings = Imaging.search_by_heights_middles_lows(height_ids, middle_ids, low_ids)

    respond_to do |format|
      format.html
      format.js { render 'set_search_contrast.js.erb' } 
    end
  end

end

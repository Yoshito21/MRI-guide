class CasesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
  end

  def create
    @case = Case.new(case_params)
    if @case.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @case.update(case_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
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
    @q = Case.ransack(params[:q])
    @cases = @q.result
  end

  private
  def case_params
    params.require(:case).permit(:name, :image, :category_id, :price).merge(user_id: current_user.id)
  end

  def set_case
    @case = Case.find(params[:id])
  end

end

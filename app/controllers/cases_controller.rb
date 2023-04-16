class CasesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @cases = Case.all
  end
    
  def new
    @case = Case.new
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

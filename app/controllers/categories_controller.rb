class CategoriesController < ApplicationController
  
  def new
    @case = Case.new
    @categories = Category.new
    @maincategories = Category.all.order("id ASC").limit(5)
  end
  
  def search
    item = Category.find(params[:id])
    children_item = item.children
    render json:{ item: children_item }
  end
  
  def create
    @category = Category.new(category_params)
    if @category.path.save
      redirect_to case_index_path
    else
      render :new
    end
  end
  
  private

  def case_params
    params.require(:category).permit(:name, :ancestry)
  end
end

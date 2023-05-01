class OccupationsController < ApplicationController
    before_action :set_occupation, only: [:show]

    def new
      @occupation = Occupation.new
    end
  
    def create
      binding.pry
      @occupation = Occupation.new(occupation_params)
      if @occupation.valid?
        @occupation.save
        redirect_to root_path
      else
        render :new
      end
    end
  
    def show
      @user = User.find(params[:id])
      @occupations = Occupation.all
    end

    private
    
    def occupation_params
      params.require(:occupation).permit(:name, :post_code, :prefecture1_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
    end
    
  def set_occupation
    @occupation = Occupation.find(params[:id])
  end

end

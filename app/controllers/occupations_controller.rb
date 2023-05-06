class OccupationsController < ApplicationController
    before_action :set_occupation, only: [:show]

    def new
      @occupation = Occupation.new
    end
  
    def create
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
    @users = @occupation.users
    @conditions = @occupation.conditions.select(:imaging_id).distinct
    @imagings = @conditions.map(&:imaging)
    @machines = @occupation.machines
  end

  def edit
  end

  def update
    if @occupation.valid?
      @occupation.update(occupation_params)
      current_user.update(occupation_id: @occupation.id)
      redirect_to root_path
    else
      render :new
    end

    private
    
    def occupation_params
      params.require(:occupation).permit(:name, :post_code, :prefecture1_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
    end
    
  def set_occupation
    @occupation = Occupation.find(params[:id])
  end

end


#@occupations = Occupation.find(params[:id])
#@imaging = Imaging.find(params[:id])
#@occupation = Occupation.includes(conditions: :imaging).find(params[:id])
#@condid = Condition.select(:imaging_id).distinct
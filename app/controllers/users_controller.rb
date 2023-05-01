class UsersController < ApplicationController
  def new
    @occupation_user = OccupationUser.new
  end

  def create
    @occupation_user = OccupationUser.new(occupation_params)
    if @occupation_user.valid?
      @occupation_user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @occupation = Occupation.new
  end

  private
  
  def occupation_params
    params.require(:occupation_user).permit(:name, :post_code, :prefecture1_id, :municipality, :address, :building_name, :phone_number,
      :nickname, :prefecture2_id, :email, :password, :password_confirmation, :occupation_id).merge(user_id: current_user.id)
  end
end

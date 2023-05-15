class OccupationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_occupation, only: [:show, :edit, :update, :destroy]

  def new
    @occupation = Occupation.new
  end
  def create
    @occupation = Occupation.new(occupation_params)
    if @occupation.valid?
      @occupation.save
      current_user.update(occupation_id: @occupation.id)
      flash[:success] = "所属施設を登録しました。"
      redirect_to occupation_path(@occupation)
    else
      render :new
    end
  end

  def show
    @users = @occupation.users
    @conditions = @occupation.conditions.select(:imaging_id).distinct
    @imagings = @conditions.map(&:imaging)
    @machine = Machine.find_by(params[id: @machine_id])
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
  end
  
  def destroy
    if @occupation == current_user.occupation
      @occupation.conditions.destroy_all
      @occupation.occupation_machines.destroy_all
      # @occupation を参照している users レコードを取得して削除する
      User.where(occupation_id: @occupation.id).update_all(occupation_id: nil)
      # @occupation を参照している machines レコードを取得して削除する
      Machine.where(occupation_id: @occupation.id).destroy_all
      
      @occupation.destroy
      @occupation = Occupation.find_by(name: "未登録")
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def occupation_params
    params.require(:occupation).permit(:name, :post_code, :prefecture1_id, :municipality, :address, :building_name, :phone_number)
  end

  def set_occupation
    @occupation = Occupation.find(params[:id])
  end
end


#@occupations = Occupation.find(params[:id])
#@imaging = Imaging.find(params[:id])
#@occupation = Occupation.includes(conditions: :imaging).find(params[:id])
#@condid = Condition.select(:imaging_id).distinct
class OccupationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_occupation, only: [:show, :edit, :update, :destroy]
  before_action :set_not_admin, only: [:show, :edit, :update, :destroy]
  skip_before_action :set_search_query, only: [:search]

  def index
    @occupation = Occupation.all
  end
  
  def new
    @occupation = Occupation.new
  end
  
  def create
    @occupation = Occupation.new(occupation_params)
    if @occupation.valid?
      @occupation.save
      current_user.update_columns(occupation_id: @occupation.id)
      flash[:success] = "所属施設を登録しました。"
      redirect_to occupation_path(@occupation)
    else
      render :new
    end
  end

  def show
    @users = @occupation.users
    @conditions = @occupation.conditions.select(:imaging_id).distinct
    @imgs = @conditions.map(&:imaging)
    @machine = Machine.find_by(params[id: @machine_id])
    @machines = @occupation.machines
  end

  def edit
  end

  def update
    if @occupation.valid?
      @occupation.update(occupation_params)
      redirect_to occupation_path(@occupation)
    else
      render :new
    end
  end
  
  def destroy
    if @occupation == current_user.occupation || current_user.id == 1
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

  def search
    prefecture1_id = params[:prefecture1_id]
    phone_number = params[:phone_number]
    name = params[:name]
    @occupations = Occupation.all
    
    # 検索条件が指定されている場合には条件を追加する
    @occupations = @occupations.where(prefecture1_id: prefecture1_id) if prefecture1_id.present?
    @occupations = @occupations.where(phone_number: phone_number) if phone_number.present?
    @occupations = @occupations.where("name LIKE ?", "%#{name}%") if name.present?
    
    respond_to do |format|
      format.json { render json: @occupations }
      format.html
    end
  end

  def leave
    @occupation = Occupation.find(params[:id])
    
    if current_user.occupation == @occupation
      current_user.update_columns(occupation_id: nil)
      flash[:success] = '脱退しました。'
      if @occupation.users.count.zero?
        @occupation.destroy
        flash[:notice] = 'Occupationが削除されました。'
        redirect_to root_path
      else
        redirect_to occupation_path(id: @occupation.id)
      end
    else
      flash[:error] = '脱退に失敗しました。'
      redirect_to occupation_path(id: @occupation.id)
    end
  end
  
  
  
  private

  def occupation_params
    params.require(:occupation).permit(:name, :post_code, :prefecture1_id, :municipality, :address, :building_name, :phone_number)
  end

  def set_occupation
    @occupation = Occupation.find(params[:id])
  end

  def set_not_admin
    if current_user.occupation.present?
      if current_user.occupation.id !=1 && (@occupation.id == 1 || @occupation.id == 2)
        redirect_to root_path
        return
      end
    else
      if @occupation.id == 1 || @occupation.id == 2
        redirect_to root_path
        return
      end
    end
  end
end


#@occupations = Occupation.find(params[:id])
#@imaging = Imaging.find(params[:id])
#@occupation = Occupation.includes(conditions: :imaging).find(params[:id])
#@condid = Condition.select(:imaging_id).distinct
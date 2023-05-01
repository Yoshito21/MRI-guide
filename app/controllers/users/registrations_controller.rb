class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
      unless @user.valid?
        render :new and return
      end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @occupation = @user.build_occupation
    render :new_occupation
  end

  def create_occupation
    @user = User.new(session["devise.regist_data"]["user"])
    # 既存のoccupationがある場合は、それを使用する
    occupation = Occupation.find_by(prefecture1_id: occupation_params[:prefecture1_id], post_code: occupation_params[:post_code], phone_number: occupation_params[:phone_number])
    if occupation.present?
      @user.occupation = occupation
    else
      @occupation = Occupation.new(occupation_params)
      unless @address.valid?
        render :new_address and return
      end
      @user.build_occupation(@occupation.attributes)
    end
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  private

  def occupation_params
    params.require(:occupation).permit(:name, :prefecture1_id, :post_code, :phone_number)
  end



  protected

  #アカウント登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    root_path(resource)
  end

  # パスワードなしで更新できるメソッド
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  #アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    root_path(resource)
  end
end

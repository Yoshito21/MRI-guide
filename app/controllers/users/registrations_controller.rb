class Users::RegistrationsController < Devise::RegistrationsController
  protected

  #アカウント登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    root_path
  end

  #アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    root_path
  end
end

class Users::RegistrationsController < Devise::RegistrationsController
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

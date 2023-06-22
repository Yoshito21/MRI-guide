class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search_query, unless: -> { devise_controller? || action_name == 'new' || action_name == 'edit' || controller_name == 'contacts' }

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :email, :encrypted_password, :prefecture2_id])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:nickname, :email, :encrypted_password, :prefecture2_id])
  end
  
  def set_search_query
    if params[:q]&.dig(:purpose_cont)
      squished_keywords = params[:q][:purpose_cont].squish
      params[:q][:purpose_cont_cont_any] = squished_keywords.split(" ")
    end
    @q = Imaging.ransack(params[:q])
    session[:search_params] = params[:q]
    @imagings = @q.result(distinct: true).order(created_at: :desc).limit(5).records
  
    respond_to do |format|
      format.json{ render json: @imagings }
      format.html 
    end
  end
end
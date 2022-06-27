class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :except => [:home]
  protect_from_forgery prepend: true
  before_action :permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(*)
    new_user_session_path
  end
  
  def after_sign_in_path_for(*)
    new_users_categories_path
  end

  def after_sign_up_path_for(*)
  end

  protected

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
  end
end
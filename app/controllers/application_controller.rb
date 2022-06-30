class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:home]
  protect_from_forgery prepend: true
  before_action :permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(*)
    new_user_session_path
  end

  def after_sign_in_path_for(_resource)
    user_categories_path(current_user.id)
  end

  def after_sign_up_path_for(_resource)
    user_categories_path(current_user.id)
  end

  protected

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
  end
end

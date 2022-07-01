class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    redirect_to user_categories_path(current_user.id) if user_signed_in?
  end
end

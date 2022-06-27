class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to users_categories_path
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end

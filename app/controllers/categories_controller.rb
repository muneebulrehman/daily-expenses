class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      flash[:success] = "Category created"
      redirect_to user_categories_path(current_user.id)
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category updated successfully"
      redirect_to user_categories_path(current_user.id)
    else
      render :edit
    end
  end

  def check_user
    if current_user != nil && current_user.id != params[:user_id].to_i
      flash[:error] = 'You are not authorized to access this page'
      redirect_to user_categories_path(current_user.id)
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end

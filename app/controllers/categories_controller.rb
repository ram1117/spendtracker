class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all.includes(:spendings)
    @user = current_user
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    category = Category.new(
      name: new_category_params['name'],
      icon: new_category_params['icon'],
      user_id: @user.id
    )
    if category.save
      flash[:success] = 'Category created successfully'
      redirect_to user_categories_path(user_id: @user.id)
    else
      flash[:alert] = 'error creating new Category'
    end
  end

  def show
    @user = current_user
    @category = Category.find(params[:id])
    @spendings = @category.spendings.order('created_at DESC')
  end

  private

  def new_category_params
    params.require(:new_category).permit(:name, :icon)
  end
end

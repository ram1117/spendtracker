class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    return unless user_signed_in?

    redirect_to user_categories_path(user_id: @user.id)
  end
end

class SpendingsController < ApplicationController
  def new
    @user = User.first
    @categories = Category.all
    @category = Category.find(params[:category_id])
  end

  def create
    @user = User.first

    begin
      spending = Spending.create(
        name: spending_params['name'],
        amount: spending_params['amount'],
        author_id: @user.id
      )
      spending_params['category_ids'].each do |c_id|
        next if c_id.empty?

        category = Category.find(c_id.to_i)
        SpendItem.create(
          spending_id: spending.id,
          category_id: category.id
        )
      end
      flash[:success] = 'New spending added successfully'
      redirect_to user_category_path(user_id: @user.id, id: params[:category_id])
    rescue ActiveRecord::RecordInvalid
      flash[:success] = 'Error creating spending'
    end
  end

  private

  def spending_params
    params.require(:new_spending).permit(:name, :amount, category_ids: [])
  end
end

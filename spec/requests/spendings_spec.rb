require 'rails_helper'

RSpec.describe 'Spendings', type: :request do
  before :each do
    @user = User.first
    sign_in @user
  end

  after :each do
    sign_out @user
  end

  describe 'GET users/:user_id/categories/:categories_id/spendings/new' do
    it 'is valid response' do
      get new_user_category_spending_path(user_id: @user.id, category_id: @user.categories.first.id)
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get new_user_category_spending_path(user_id: @user.id, category_id: @user.categories.first.id)
      expect(response).to render_template 'spendings/new'
    end

    it 'contains placeholder text' do
      get new_user_category_spending_path(user_id: @user.id, category_id: @user.categories.first.id)
      expect(response.body).to include('Add a spending')
    end
  end

  describe 'POST users/:user_id/categories/:categories_id/spendings/' do
    it 'creates a new spending for a category' do
      post user_category_spendings_path(user_id: @user.id, category_id: @user.categories.first.id),
           params: {
             new_spending:
             {
               name: 'New spending item',
               amount: 10.0,
               category_ids: [@user.categories.first.id.to_s]
             }
           }
      expect(@user.categories.first.spendings.count).to eql 3
    end
  end
end

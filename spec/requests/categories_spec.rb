require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before :each do
    @user = User.first
    sign_in @user
  end

  after :each do
    sign_out @user
  end

  describe 'GET users/:user_id/categories' do
    it 'is valid response' do
      get user_categories_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get user_categories_path(user_id: @user.id)
      expect(response).to render_template 'categories/index'
    end

    it 'contains placeholder text' do
      get user_categories_path(user_id: @user.id)
      expect(response.body).to include('categories')
    end
  end

  describe 'GET users/:user_id/categories/new' do
    it 'is valid response' do
      get new_user_category_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get new_user_category_path(user_id: @user.id)
      expect(response).to render_template 'categories/new'
    end
    it 'contains placeholder text' do
      get new_user_category_path(user_id: @user.id)
      expect(response.body).to include('Add a Category')
    end
  end

  describe 'POST users/:user_id/categories/' do
    it 'creates a new category for user' do
      post user_categories_path(user_id: @user.id),
           params: { new_category: { name: 'test category 1', icon: 'shopping_cart', user_id: @user.id } }
      expect(@user.categories.count).to eql 5
    end
  end

  describe 'GET users/:user_id/categories/id' do
    it 'is valid response' do
      get user_category_path(user_id: @user.id,id: @user.categories.first.id)
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get user_category_path(user_id: @user.id,id: @user.categories.first.id)
      expect(response).to render_template 'categories/show'
    end
    it 'contains placeholder text' do
      get user_category_path(user_id: @user.id,id: @user.categories.first.id)
      expect(response.body).to include('Category: groceries')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Categories#index', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit user_categories_path(user_id: @user.id)
    expect(page).to have_content('categories')
    expect(page).to have_content('Total Amount 25.5')
  end

  it 'clicking a category link redirects to category#show page' do
    cat_id = @user.categories.first.id
    visit user_categories_path(user_id: @user.id)
    find_link('groceries').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories/#{cat_id}"
  end

  it 'clicking add new category redirects to categories#new' do
    visit user_categories_path(user_id: @user.id)
    find(:button, 'Add New Category').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories/new"
  end
end

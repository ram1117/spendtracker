require 'rails_helper'
RSpec.describe 'Categories#Show', type: :system do
  before :each do
    @user = User.first
    @category = @user.categories.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit user_category_path(user_id: @user.id, id: @category.id)
    expect(page).to have_content('Category: groceries')
  end

  it 'click back button reroutes to categories#idnex page' do
    visit user_category_path(user_id: @user.id, id: @category.id)
    first('button.custom-nav-button').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories"
  end

  it 'click New spending reroutes to spendings#new page' do
    visit user_category_path(user_id: @user.id, id: @category.id)
    find_link('New Spending').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories/#{@category.id}/spendings/new"
  end

end

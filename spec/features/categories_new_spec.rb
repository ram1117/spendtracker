require 'rails_helper'

RSpec.describe 'Categories#New', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit new_user_category_path(user_id: @user.id)
    expect(page).to have_content('Add a Category')
  end

  it 'click back button reroutes to categories#index page' do
    visit new_user_category_path(user_id: @user.id)
    first('button.custom-nav-button').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories"
  end

  it 'submit form reroutes to categories#index page' do
    visit new_user_category_path(user_id: @user.id)
    fill_in 'new_category_name', with: 'test category'
    find('button#icon-popup').click
    choose(option: 'store')
    find(:button, 'Select').click
    sleep 1
    find('input[name="commit"]').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories"
  end

  it 'click cancel reroutes to reroutes to categories#index page' do
    visit new_user_category_path(user_id: @user.id)
    find_link('Cancel').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories"
  end
end

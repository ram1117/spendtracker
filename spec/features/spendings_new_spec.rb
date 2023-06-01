require 'rails_helper'

RSpec.describe 'Spendings#New', type: :system do
  before :each do
    @user = User.first
    @category = @user.categories.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit new_user_category_spending_path(user_id: @user.id, category_id: @category.id)
    expect(page).to have_content('Add a spending')
  end

  it 'click back button reroutes to categories#show page' do
    visit new_user_category_spending_path(user_id: @user.id, category_id: @category.id)
    find_link('nav-back-link').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories/#{@category.id}"
  end

  it 'click cancel reroutes to reroutes to categories#show page' do
    visit new_user_category_spending_path(user_id: @user.id, category_id: @category.id)
    find_link('Cancel').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories/#{@category.id}"
  end

  it 'csubmit form reroutes to categories#show page' do
    visit new_user_category_spending_path(user_id: @user.id, category_id: @category.id)
    fill_in 'new_spending_name', with: 'concert tickets'
    fill_in 'new_spending_amount', with: 40.50
    find('#new_spending_category_ids').find(:xpath, 'option[3]').select_option
    find('input[name="commit"]').click
    sleep 1
    expect(current_path).to eql "/users/#{@user.id}/categories/#{@category.id}"
  end
end

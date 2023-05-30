require 'rails_helper'

RSpec.describe 'Users#index', type: :system do
  before :each do
    @user = User.first
  end
  it 'has placeholder text content' do
    visit users_path
    expect(page).to have_content('Spendings Tracker')
  end

  it 'when clicked on sign in button redirects to sign_in page' do
    visit users_path
    find(:button, 'Sign In').click
    sleep 1
    expect(current_path).to eql '/users/sign_in'
  end

  it 'when clicked on sign up button redirects to sign_up page' do
    visit users_path
    find(:button, 'Sign Up').click
    sleep 1
    expect(current_path).to eql '/users/sign_up'
  end
end

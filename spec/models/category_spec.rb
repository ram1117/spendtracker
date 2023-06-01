require 'rails_helper'

RSpec.describe Category, type: :model do
  before :all do
    @category =
      Category.create(
        name: 'test category',
        icon: 'shopping_cart',
        user_id: User.first.id
      )
    @spending = Spending.create(
      name: 'weeky groceries',
      amount: 15.50,
      author_id: User.first.id
    )

    @spend_item = SpendItem.create(
      spending_id: Spending.first.id,
      category_id: Category.first.id
    )
  end

  describe 'check category validity' do
    it 'is valid with valid attributes' do
      expect(@category).to be_valid
    end
  end

  describe 'check category invalidity' do
    it 'is invalid with invalid name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'is invalid with invalid icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end

  describe '#total_amount' do
    it 'return total amount for category' do
      expect(@category.total_amount).to eql 0
    end
  end
end

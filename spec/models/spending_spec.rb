require 'rails_helper'

RSpec.describe Spending, type: :model do
  subject do
    Spending.new(
      name: 'test spending',
      amount: 10.50,
      author_id: User.first.id
    )
  end
  before { subject.save }
  describe 'check spending validity' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'check spendign invalidity' do
    it 'is invalid with invalid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with invalid amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with negative amount' do
      subject.amount = -5.0
      expect(subject).to_not be_valid
    end
  end
end

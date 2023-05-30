class Spending < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :spend_items, dependent: :destroy
  has_many :categories, through: :spend_items

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
end

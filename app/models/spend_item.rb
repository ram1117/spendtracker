class SpendItem < ApplicationRecord
  belongs_to :category
  belongs_to :spending
end

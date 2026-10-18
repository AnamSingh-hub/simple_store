
class Product < ApplicationRecord
  belongs_to :category, optional: true

  validates :title, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
end

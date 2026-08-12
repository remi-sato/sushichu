class Sushi < ApplicationRecord
  has_one_attached :image
  has_many :order_items, dependent: :destroy
  has_many :order, through: :order_items
end

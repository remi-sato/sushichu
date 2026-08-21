class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :sushis, through: :order_items

  enum :status, {
    cart: 0,
    ordered: 1,
    preparing: 2,
    completed: 3
  }
end

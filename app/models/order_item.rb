class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :sushi

  enum :status, {
    ordered: 0,
    completed: 1
  }
end

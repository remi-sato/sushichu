class Kitchen::OrdersController < ApplicationController
  def index
    @order_items = OrderItem
      .joins(:order)
      .where(orders: { status: [:ordered, :preparing] })
      .includes(:sushi, :order)
      .order(created_at: :asc)
  end
end

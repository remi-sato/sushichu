class Kitchen::OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])

    order_item.update!(status: :completed)

    order = order_item.order

    if order.order_items.all?(&:completed?)
      order.update!(status: :completed)
    end

    redirect_to kitchen_orders_path, notice: "提供済にしました"
  end
end
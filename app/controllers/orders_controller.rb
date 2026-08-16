class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: session[:order_id], status: :cart)

    if @order
      @order_items = @order.order_items.includes(:sushi)
      @total_price = @order_items.sum do |order_item|
        order_item.sushi.price * order_item.quantity
      end
    else
      @order_items = []
      @total_price = 0
    end
  end
end

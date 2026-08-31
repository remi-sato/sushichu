class OrdersController < ApplicationController
  def index
    order_ids = session[:ordered_order_ids] || []

    @order_items = OrderItem
      .joins(:order)
      .where(
        orders: {
          id: order_ids,
          status: [:ordered, :preparing, :completed]
        }
      )
      .includes(:sushi)
      .order(created_at: :asc)

    @total_price = @order_items.sum do |order_item|
      order_item.sushi.price * order_item.quantity
  end
end

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

  def update
    order = Order.find_by(id: session[:order_id], status: :cart)
    if order.nil? || order.order_items.empty?
      redirect_to cart_path, alert: "カートに商品がありません"
      return
    end
    order.update!(status: :ordered)

    session[:ordered_order_ids] ||= []
    session[:ordered_order_ids] << order.id

    session.delete(:order_id)
    redirect_to root_path, notice: "注文を確定しました"
  end
end

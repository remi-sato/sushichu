class Kitchen::OrdersController < ApplicationController
  def index
    @orders = Order
      .where(status: [:ordered, :preparing])
      .includes(order_items: :sushi)
      .order(created_at: :asc)
  end

  def update
    order = Order
      .where(status: [:ordered, :preparing])
      .find(params[:id])
    
    if order.ordered?
      order.update!(status: :preparing)
      message = "調理を開始しました"
    else
      order.update!(status: :completed)
      message = "提供を完了しました"
    end
    
    redirect_to kitchen_orders_path, notice: message
  end
end

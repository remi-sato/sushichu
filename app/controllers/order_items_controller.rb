class OrderItemsController < ApplicationController
  def create
    sushi = Sushi.find(params[:sushi_id])
    quantity = params[:quantity].to_i

    unless quantity.between?(1, 10)
      redirect_to sushi_path(sushi), alert: "数量を正しく選択してください"
      return
    end

    order = Order.find_by(id: session[:order_id])

    if order.nil? || !order.cart?
      order = Order.create
      session[:order_id] = order.id
    end

    order_item = order.order_items.find_or_initialize_by(sushi: sushi)

    if order_item.persisted?
      order_item.quantity += quantity
    else
      order_item.quantity = quantity
    end

    order_item.save!

    redirect_to sushi_path(sushi), notice: "カートに追加しました"
  end

  # 数量変更
  def update
    order = Order.find_by!(id: session[:order_id], status: :cart)
    order_item = order.order_items.find(params[:id])

    if order_item.update(order_item_params)
      redirect_to cart_path, notice: "数量を変更しました"
    else
      redirect_to cart_path, alert: "数量を変更できませんでした"
    end
  end

  def destroy
    order = Order.find_by!(id: session[:order_id], status: :cart)
    order_item = order.order_items.find(params[:id])

    order_item.destroy!

    redirect_to cart_path, notice: "カートから削除しました"
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end
end
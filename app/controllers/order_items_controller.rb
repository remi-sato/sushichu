class OrderItemsController < ApplicationController
  def create
    sushi = Sushi.find(params[:sushi_id])

    # 現在のカートを探す
    order = Order.find_by(id: session[:order_id])

    # カートが必要か確認する(カートがないか、あるがstatusがcartじゃない場合)
    if order.nil? || !order.cart?
      # 新しくカートを作る
      order = Order.create
      # カートIDをsesisonへ保存する
      session[:order_id] = order.id
    end

    # 同じ寿司がカート内にあるか探す
    order_item = order.order_items.find_or_initialize_by(sushi: sushi)

    # 保存済みか確認する
    if order_item.persisted?
      # すでにあれば数量を増やす
      order_item.quantity += 1
    else
      # 初めてなら数量を１にする
      order_item.quantity = 1
    end

    # 注文商品を保存する
    order_item.save!

    # 寿司詳細画面へ戻る
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
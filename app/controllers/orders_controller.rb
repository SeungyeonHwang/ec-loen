class OrdersController < ApplicationController
  # 全体適用
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order("created_at DESC")
  end

  def create
    order = Order.create(user_id: current_user.id)

    # カートに入っている商品のId取得
    carts = Cart.where(id: params[:cart_id])

    carts.each do |cart|
      order.order_items.create(cosmetic_id: cart.cosmetic.id, quantity: cart.quantity)
      cart.cosmetic.update(count: cart.cosmetic.count+1)
    end

    # 注文した後はカートの内容を削除
    carts.destroy_all

    # ordersのShowへ転移
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy
    redirect_back(fallback_location: root_path)
  end
end

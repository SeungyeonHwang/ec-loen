class OrdersController < ApplicationController
  def create
    order = Order.create(user_id: current_user.id)

    #カートに入っている商品のId取得
    carts = Cart.where(id: params[:cart_id])

    carts.each do |cart|
      order.order_items.create(cosmetic_id: cart.cosmetic.id, quantity: cart.quantity)
    end

    #注文した後はカートの内容を削除
    carts.destroy_all

    #ordersのShowへ転移
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find(params[:id])
  end
end

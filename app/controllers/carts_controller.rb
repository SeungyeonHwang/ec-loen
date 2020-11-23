class CartsController < ApplicationController
  before_action :authenticate_user!

  # カート情報の連携
  # カートで表示される商品の小計
  def index
    @carts = current_user.carts

    @items_price = 0
    @carts.each do |cart|
      @items_price += cart.quantity * cart.cosmetic.price
    end

    @shipping_fee = 250

  #購買金額が10000以上の場合は配送料が無料になる
    if @items_price >= 10000
      @shipping_fee = 0
    else
      @shipping_fee = 250
    end

    @total_price = @items_price + @shipping_fee
  end

  def create

    # 商品をカートに入れるコード
      cart = Cart.new(
        cosmetic_id: params[:cosmetic_id],
        user_id: current_user.id,
        quantity: params[:quantity],
      )

    # 既存のカートに同一商品があるか判断する処理
      user_carts = current_user.carts

      origin_cart = user_carts.find_by(cosmetic_id: params[:cosmetic_id])

      if origin_cart.present?
        total_quantity = origin_cart.quantity + params[:quantity].to_i

        origin_cart.update(quantity: total_quantity)
      else
        cart.save
      end

    # redirect_backで使えるAlert。（Create成功を前提にする）
    flash[:notice] = "カートに追加されました。レジに進みますか？"

    redirect_back(fallback_location: root_path)
  end

  def destroy
    cart = Cart.find(params[:id])

    cart.destroy
    redirect_back(fallback_location: root_path)
  end
end

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

    # 購買金額が10000以上の場合は配送料が無料になる
    @shipping_fee = if @items_price >= 10_000
                      0
                    else
                      250
                    end

    @total_price = @items_price + @shipping_fee
  end

  # 商品をカートに入れるコード
  def create
    cart = Cart.new(
      cosmetic_id: params[:cosmetic_id],
      user_id: current_user.id,
      quantity: params[:quantity]
    )

    # 既存のカートに同一商品があるか判断する処理
    cart.verified_save

    # redirect_backで使えるAlert。（Create成功を前提にする）
    # flash[:notice] = 'カートに追加されました。レジに進みますか？'
    @notice = 'カートに追加されました。レジに進みますか？'

    # redirect_back(fallback_location: root_path)
    # cart->create.js.erb
    respond_to do |format|
      format.js
    end
  end

  def destroy
    cart = Cart.find(params[:id])

    cart.destroy
    redirect_back(fallback_location: root_path)
  end
end

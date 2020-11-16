class CartsController < ApplicationController
  before_action :authenticate_user!

  # カート情報の連携
  def index
    @carts = current_user.carts
  end

  ##TODO: 既存のカートに同一商品があるか判断する処理　１６：４１
  user_carts = current_user.carts

  origin_cart = user_carts.find_by(cosmetic_id: params[:cosmetic_id])

  # 商品をカートに入れるコード
  def create
    Cart.create(
      cosmetic_id: params[:cosmetic_id],
      user_id: current_user.id,
      quantity: params[:quantity],
    )

    # redirect_backで使えるAlert。（Create成功を前提にする）
    flash[:notice] = "カートに追加されました。レジに進みますか。"

    redirect_back(fallback_location: root_path)
  end

  def destroy
    cart = Cart.find(params[:id])

    cart.destroy
    redirect_back(fallback_location: root_path)
  end
end

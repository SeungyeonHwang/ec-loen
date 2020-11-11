class CartsController < ApplicationController
  before_action :authenticate_user!

  def create
    Cart.create(
      cosmetic_id: params[:cosmetic_id],
      user_id: current_user.id,
      quantity: params[:quantity],
    )

    redirect_back(fallback_location: root_path)
  end
end

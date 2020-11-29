class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :cosmetic

  # carts_controllerの処理をメソッド化
  def verified_save
    user_carts = user.carts

    origin_cart = user_carts.find_by(cosmetic_id: cosmetic_id)

    if origin_cart.present?
      total_quantity = origin_cart.quantity + quantity.to_i

      origin_cart.update(quantity: total_quantity)
    else
      save
    end
  end
end

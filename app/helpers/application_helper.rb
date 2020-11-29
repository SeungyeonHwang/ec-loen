module ApplicationHelper
  def price_to_currency(item)
    number_to_currency(item.quantity * item.cosmetic.price)
  end

  def cart_to_currency(cart)
    number_to_currency(cart.quantity * cart.cosmetic.price)
  end
end

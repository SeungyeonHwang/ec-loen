class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy
  has_many :cosmetics, through: :order_items

  enum status: %i[before_payment processing completed order_failed]

  def product_price
    result = 0
    order_items.each do |order_item|
      result += (order_item.quantity * order_item.cosmetic.price)
    end

    result
  end

  def shipping_fee
    result = if product_price > 10_000
               0
             else
               250
             end
    result
  end

  def total_price
    result = product_price + shipping_fee
    result
  end
end

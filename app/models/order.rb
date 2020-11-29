class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy
  has_many :cosmetics, through: :order_items

  # 1つの注文に1つの支払いのみ存在させる設定(単数)
  # nullifyはOrderが削除された時、Id値がNullになる → 状況によってSoftDeleteがいい時もある。
  has_one :payment, dependent: :nullify

  # !でstatusを変更できるようにするコード
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

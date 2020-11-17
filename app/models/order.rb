class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy
  has_many :cosmetics, through: :order_items

  enum status: [:before_payment, :processing, :completed, :order_failed]
end

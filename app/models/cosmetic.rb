class Cosmetic < ApplicationRecord
  has_one_attached :image

  #存在するべき項目
  validates :product_name, :company_name, :price, presence: true

  #nilがない場合保存する
  validates :is_open, exclusion: { in: [nil] }

  scope :Opend, -> { Cosmetic.where(is_open: true) }
  scope :Closed, -> { Cosmetic.where(is_open: false) }
end

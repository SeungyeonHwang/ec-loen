class Cosmetic < ApplicationRecord
  has_one_attached :image

  #存在するべき項目
  validates :product_name, :company_name, :price, presence: true

  #nilがない場合保存する
  validates :is_open, exclusion: { in: [nil] }

  scope :Opend, -> { Cosmetic.where(is_open: true) }
  scope :Closed, -> { Cosmetic.where(is_open: false) }

  has_many :carts, dependent: :destroy
  has_many :users, through: :carts

  #ダミーデーター作成
  def self.set_dummy_datas
    30.times do
      Cosmetic.create(
        product_name: Faker::Code.unique.npi,
        company_name: Faker::Company.name,
        price: [2000, 3000, 4000].sample
      )
    end
  end
end

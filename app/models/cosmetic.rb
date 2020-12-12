require "open-uri"

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

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  has_many :comments, dependent: :destroy

  def ave_score
    if comments.present?
      result = comments.average(:score).round
    else
      result = 0
    end
    result
  end

  def comment_count
    if comments.present?
      result = comments.count
    else
      result = 0
    end
      result
  end

  #ダミーデーター作成
  def self.set_dummy_data
    30.times do |i|
      cosmetic = Cosmetic.new(
        product_name: Faker::Code.unique.npi,
        company_name: Faker::Company.name,
        price: [2000, 3000, 4000].sample,
      )

      # ActiveStroageのイメージ作成機能
      sample_image = open("https://picsum.photos/700/400?random=#{i}")

      cosmetic.image.attach(io: sample_image, filename: "sample_#{i}.jpg")
      cosmetic.save
    end
  end
end

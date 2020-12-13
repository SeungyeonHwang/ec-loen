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
    unless comments.present?
      avg_score = 0
      update(rating: 0)
    else
      avg_score = comments.average(:score).present? ? comments.average(:score).round : 0
    end
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
        company_name: ['TONY MOLY（トニーモリー）','SKINFOOD（スキンフード）','innisfree（イニスフリー）','MISSHA（ミシャ）'].sample,
        price: [1200, 3500, 2000, 3000, 4000].sample,
        desc: ['濃密なカラー、究極のマット、唇に寄り添うしなやかなつけ心地。 まるで上質な本革を思わせる「レザーマット」な仕上がり。 初めて出会うスリムなスクエアシェイプが放つエッジーな存在感。 クチュールの上質をカジュアルに纏う、新アイコンリップスティック。',
              '微小な球体のポリエチレンスクラブとグリコール酸（角質除去成分）の効果で肌の肌リズムを整え、つるんとなめらかな素肌に導きます。また、その後に使用するスキンケア製品が効果的に浸透する状態に導きます。',
              'スキンケア効果が強化され、心地よさと24時間続くロングラスティングを実現しました。揮発性のオイルを配合し、べたつきを肌に残しません。保湿成分が肌に明るさをプラスし、ふっくらとハリのある感触をもたらし肌との密着性を高めます。',
              '透明感のあるナチュラルなツヤをのせるフィルター効果により、肌の美しさが際立ちます。なめらかでヌードなメイクアップ ルックを叶えるために、ディオールは、肌の表面で光の効果を高め、ナチュラルな質感に整える、ブラー効果を備えたマットパウダーを開発しました。'].sample
      )

      # ActiveStroageのイメージ作成機能
      sample_image = open("https://picsum.photos/700/400?random=#{i}")

      cosmetic.image.attach(io: sample_image, filename: "sample_#{i}.jpg")
      cosmetic.save
    end
  end
end

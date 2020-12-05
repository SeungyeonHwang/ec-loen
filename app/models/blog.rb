class Blog < ApplicationRecord
  has_one_attached :image

  validates :title, :image, :tag, :content, presence: true
end

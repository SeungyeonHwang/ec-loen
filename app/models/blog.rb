class Blog < ApplicationRecord
  has_one_attached :image

  validates :title, :image, :tag, :content, presence: true

  def next
    Blog.where("id > ?", id).first
  end

  def prev
    Blog.where("id < ?", id).last
  end
end

class HomeController < ApplicationController
include ActionView::Helpers::OutputSafetyHelper
  # ログインしていない場合はアクセスできないようにする処理
  before_action :authenticate_user!, only: [:mypage]

  def index
    blog_data = Blog.order("created_at DESC").limit(3)
    @blogs = blog_data

    @cosmetics_count = Cosmetic.Opend.order("count DESC").limit(4)
    # @cosmetics_rating = Cosmetic.Opend.order("rating DESC").limit(4)
    @cosmetics_rating = Cosmetic.Opend.order("rating DESC").where("rating >= ?", 4).limit(4)
  end

  def mypage
    @user = current_user
  end
end

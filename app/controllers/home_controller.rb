class HomeController < ApplicationController
include ActionView::Helpers::OutputSafetyHelper
  # ログインしていない場合はアクセスできないようにする処理
  before_action :authenticate_user!, only: [:mypage]

  def index
    blog_data = Blog.order("created_at DESC").limit(3)
    @blogs = blog_data
  end

  def mypage
    @user = current_user
  end
end

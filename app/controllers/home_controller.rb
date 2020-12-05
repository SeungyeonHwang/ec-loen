class HomeController < ApplicationController
  # ログインしていない場合はアクセスできないようにする処理
  before_action :authenticate_user!, only: [:mypage]

  def index
    @blogs = Blog.order("created_at DESC").limit(3)
  end

  def mypage
    @user = current_user
  end
end

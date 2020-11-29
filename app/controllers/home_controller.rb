class HomeController < ApplicationController
  # ログインしていない場合はアクセスできないようにする処理
  before_action :authenticate_user!, only: [:mypage]

  def index; end

  def mypage
    @user = current_user
  end
end

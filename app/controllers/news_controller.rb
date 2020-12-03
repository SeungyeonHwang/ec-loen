class NewsController < ApplicationController
  def index
    @news = News.order("created_at DESC").all
  end

  def show
    @news = News.find(params[:id])
  end
end

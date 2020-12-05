class BlogsController < ApplicationController
  def index
    @blogs = Blog.order("created_at DESC").all
    @tags = Blog.all.select(:tag).distinct

    if params[:tag].present?
      @blogs = Blog.where(tag: params[:tag]).order("created_at DESC").all
    end

  end
  def show
    @blogs = Blog.find(params[:id])
  end
end

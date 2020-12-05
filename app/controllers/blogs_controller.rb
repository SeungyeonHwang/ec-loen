class BlogsController < ApplicationController
  def index
    @blogs = Blog.order("created_at DESC").all
  end

  def show
    @blogs = Blog.find(params[:id])
  end
end

class CosmeticsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @cosmetics = Cosmetic.Opend
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end

  # def change
  #   @cosmetic = Cosmetic.find(params[:id])

  #   @score='ddd'
    
  #   respond_to do |format|
  #     format.js
  #   end

  def create_comment
    @cosmetic = Cosmetic.find(params[:id])
    @comment = Comment.create(user_id: current_user.id, cosmetic_id: @cosmetic.id, contents: params[:contents])
    # 縮約 @cosmetic.comments.new(user_id: current_user.id).save 
  end

  def destroy_comment
    @comment = Comment.find(params[:comment_id]).destroy
  end
  
  
  def update_comment
    @comment = Comment.find(params[:comment_id])
    @comment.update(contents: params[:contents])
  end
end


class CosmeticsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    # 並び順を変える処理
    event = params[:event_count]
    
    if event == '0'
      @cosmetics = Cosmetic.Opend.order("count DESC")

    elsif event == '1'
      @cosmetics = Cosmetic.Opend.order("rating DESC")

    elsif event == '2'
      @cosmetics = Cosmetic.Opend.order("price DESC")
    
    elsif event == '2-1'
      @cosmetics = Cosmetic.Opend.order("price ASC")
    
    else
      @cosmetics = Cosmetic.Opend.order("created_at DESC")
    end

    @hot_cosmetics = Cosmetic.Opend.order("count DESC").limit(3)
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end

  def create_comment
    @cosmetic = Cosmetic.find(params[:id])
    @comment = Comment.create(user_id: current_user.id, cosmetic_id: @cosmetic.id, contents: params[:contents], score: params[:score])
    ave_score_update = @cosmetic.ave_score
    @cosmetic.update(rating: ave_score_update)
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


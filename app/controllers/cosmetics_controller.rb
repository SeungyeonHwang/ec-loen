class CosmeticsController < ApplicationController
  before_action :authenticate_user!, only: [:create_comment, :destroy_comment, :update_comment]
  skip_before_action :verify_authenticity_token

  def index
    # 並び順を変える処理
    event = params[:event_count]
    company_name_select = params[:company_name_select]

    @cosmetics = Cosmetic.Opend.where(company_name: company_name_select).order("created_at DESC")

    if event.present?
      if event == "0"
        @cosmetics = Cosmetic.Opend.order("count DESC")
      elsif event == "1"
        @cosmetics = Cosmetic.Opend.order("rating DESC")
      elsif event == "2"
        @cosmetics = Cosmetic.Opend.order("price DESC")
      else event == "2-1"
        @cosmetics = Cosmetic.Opend.order("price ASC")
      end
    elsif company_name_select.present?
      @cosmetics = Cosmetic.Opend.where(company_name: company_name_select).order("created_at DESC")
    else
      @cosmetics = Cosmetic.Opend.order("created_at DESC")
    end
    @hot_cosmetics = Cosmetic.Opend.order("count DESC").limit(3)
    @company_names = Cosmetic.select("company_name,COUNT(company_name) AS numbers").group(:company_name).having("count(company_name) > 1")
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

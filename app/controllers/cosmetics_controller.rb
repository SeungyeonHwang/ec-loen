class CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.all
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end
end

class CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.Opend
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end
end

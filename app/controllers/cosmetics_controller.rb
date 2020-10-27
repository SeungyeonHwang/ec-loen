class CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.all
  end

  def show
  end
end

class StorefrontController < ApplicationController
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = Product.where(category: @category)
    else
      @products = Product.all
    end
  end

  def about
  end
end

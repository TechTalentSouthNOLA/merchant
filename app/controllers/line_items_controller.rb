class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    if @line_item.save
      flash[:notice] = "#{product.name} was successfully added to your cart!"
      redirect_to shop_url
    else
      flash.now[:alert] = "Could not add item to your cart."
      redirect_to :back
    end
  end
end

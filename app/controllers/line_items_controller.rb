class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    if @line_item.save
      flash[:notice] = "#{product.name} was successfully added to your cart!"
      redirect_to edit_cart_path(@cart)
    else
      flash.now[:alert] = "Could not add item to your cart."
      redirect_to :back
    end
  end

  def destroy
    @line_item = @cart.line_items.find(params[:id])
    if @line_item.destroy
      redirect_to edit_cart_path(@cart), notice: "Item removed from cart."
    else
      redirect_to @cart, alert: "Could not remove item from cart."
    end
  end
end

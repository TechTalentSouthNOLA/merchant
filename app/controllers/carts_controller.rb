class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def edit
  end

  def destroy
    if @cart.destroy
      session[:cart_id] = nil
      flash[:notice] = "Cart successfully deleted."
      redirect_to shop_url
    else
      flash[:alert] = "Could not delete cart."
      redirect_to edit_cart_url
    end
  end
end

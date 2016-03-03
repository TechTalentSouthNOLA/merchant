class OrdersController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]

  def show
    # TODO: deny access to orders of other users
    @order = Order.find(params[:id])
  end

  def new
    if @cart.line_items.empty?
      redirect_to shop_url, notice: "Your cart is empty."
      return
    end

    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      # Move items from cart to order
      @order.add_line_items_from_cart(@cart.id)

      # Destroy the cart and reset the session cart_id
      @cart.destroy
      session[:cart_id] = nil

      # Redirect and confirmation notice
      redirect_to @order, notice: "Thank you for your order!"
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_name, :shipping_address, :payment_type)
  end
end

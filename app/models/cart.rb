class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def subtotal
    # SQL version of summing which is faster than Ruby
    line_items.select("SUM(quantity * price) AS sum")[0].sum

    # Ruby version of summing
    # line_items.to_a.sum{ |item| item.total }
  end

  def add_product(product_id)
    product = Product.find(product_id)

    # Find out if this product is already in cart. If not, current_item will be nil
    current_item = line_items.find_by(product_id: product_id)

    # If current_item does exist in cart, increase the quantity. If not, build the new line item.
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product: product, price: product.current_price)
    end
    current_item
  end
end

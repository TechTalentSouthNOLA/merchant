class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  # TODO: before save, reduce product inventory quantity
  # TODO: before delete/destroy, add back to the product inventory quantity

  def total
    price * quantity
  end
end

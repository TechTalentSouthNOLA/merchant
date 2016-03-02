class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def subtotal
    # SQL version of summing which is faster than Ruby
    line_items.select("SUM(quantity * price) AS sum")[0].sum

    # Ruby version of summing
    # line_items.to_a.sum{ |item| item.total }
  end
end

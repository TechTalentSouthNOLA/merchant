json.array!(@products) do |product|
  json.extract! product, :id, :name, :current_price, :quantity, :description, :brand_id, :category_id
  json.url product_url(product, format: :json)
end

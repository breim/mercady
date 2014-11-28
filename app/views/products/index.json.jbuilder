json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :market, :user, :price, :image
  json.url product_url(product, format: :json)
end

# rvm path

json.array!(@products) do |product|
  json.extract! product, :name, :id, :title, :price, :body, :some, :scrool
  json.url product_url(product, format: :json)
end

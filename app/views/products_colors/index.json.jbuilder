json.array!(@products_colors) do |products_color|
  json.extract! products_color, :id, :product_id, :color_id
  json.url products_color_url(products_color, format: :json)
end

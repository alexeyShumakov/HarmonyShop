json.array!(@admin_products_colors) do |admin_products_color|
  json.extract! admin_products_color, :id
  json.url admin_products_color_url(admin_products_color, format: :json)
end

json.array!(@products_colors_sizes) do |products_colors_size|
  json.extract! products_colors_size, :id, :warehouse, :products_color_id, :size_id
  json.url products_colors_size_url(products_colors_size, format: :json)
end

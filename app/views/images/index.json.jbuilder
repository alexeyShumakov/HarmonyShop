json.array!(@images) do |image|
  json.extract! image, :id, :name, :products_color_id
  json.url image_url(image, format: :json)
end

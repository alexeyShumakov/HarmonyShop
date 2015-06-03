json.array!(@admin_bg_images) do |admin_bg_image|
  json.extract! admin_bg_image, :id
  json.url admin_bg_image_url(admin_bg_image, format: :json)
end

json.array!(@admin_colors) do |admin_color|
  json.extract! admin_color, :id
  json.url admin_color_url(admin_color, format: :json)
end

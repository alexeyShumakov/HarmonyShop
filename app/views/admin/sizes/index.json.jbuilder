json.array!(@admin_sizes) do |admin_size|
  json.extract! admin_size, :id
  json.url admin_size_url(admin_size, format: :json)
end

json.array!(@admin_size_helpers) do |admin_size_helper|
  json.extract! admin_size_helper, :id
  json.url admin_size_helper_url(admin_size_helper, format: :json)
end

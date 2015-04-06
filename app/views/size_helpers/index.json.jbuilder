json.array!(@size_helpers) do |size_helper|
  json.extract! size_helper, :id, :title, :body
  json.url size_helper_url(size_helper, format: :json)
end

json.array!(@sizes) do |size|
  json.extract! size, :id, :name, :code
  json.url size_url(size, format: :json)
end

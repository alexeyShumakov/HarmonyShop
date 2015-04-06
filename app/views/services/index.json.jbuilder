json.array!(@services) do |service|
  json.extract! service, :id, :title, :body
  json.url service_url(service, format: :json)
end

json.array!(@services_groups) do |services_group|
  json.extract! services_group, :id, :title
  json.url services_group_url(services_group, format: :json)
end

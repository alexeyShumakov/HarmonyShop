json.array!(@admin_services_groups) do |admin_services_group|
  json.extract! admin_services_group, :id
  json.url admin_services_group_url(admin_services_group, format: :json)
end

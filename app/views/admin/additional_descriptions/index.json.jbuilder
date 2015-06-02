json.array!(@admin_additional_descriptions) do |admin_additional_description|
  json.extract! admin_additional_description, :id
  json.url admin_additional_description_url(admin_additional_description, format: :json)
end

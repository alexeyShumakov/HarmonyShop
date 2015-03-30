json.array!(@additional_descriptions) do |additional_description|
  json.extract! additional_description, :id, :name, :description, :product_id
  json.url additional_description_url(additional_description, format: :json)
end

json.array!(@orders) do |order|
  json.extract! order, :id, :line_item, :user_id, :pay_type, :address, :phone, :delivery_type
  json.url order_url(order, format: :json)
end

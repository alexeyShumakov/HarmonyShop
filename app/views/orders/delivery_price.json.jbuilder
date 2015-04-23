json.merge! @response
json.set!(:total_price, rus_number_to_currency(@delivery_and_products_price))
json.set!(:delivery_price, rus_number_to_currency(session[:delivery_price].to_f))
json.set!(:delivery_time, session[:delivery_time])
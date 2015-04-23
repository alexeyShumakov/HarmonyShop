module DeliveryInfo
	extend ActiveSupport::Concern

	private
		def delivery_info
			url = "http://api.edostavka.ru/calculator/calculate_price_by_json.php"
			HTTParty.post(url.to_s,
        body: {
        version: '1.0',
        dateExecute: Date.tomorrow,
        senderCityId: 259,
        receiverCityId:  params[:city_id],
        tariffId: 1,
        goods: [{
          weight:0.1,
          length:5,
          width:5,
          height:1
        }, {
          weight: 0.1,
          volume: 0.1
        }]
        }.to_json,
        headers: { 'Content-Type' => 'application/json' })
    end

    def set_delivery_session
      session[:city] = params[:city]

      if @response['result']
        session[:delivery_time] = delivery_time(@response['result']['deliveryPeriodMin'].to_s,
                                                @response['result']['deliveryPeriodMax'].to_s)
        session[:delivery_price] = @response['result']['price'].to_f
      else
        session[:delivery_time] = 'неверно указан город'
        session[:delivery_price] = 0
      end
    end

    def clear_delivery_session
      session.delete(:delivery_price)
      session.delete(:delivery_time)
      session.delete(:city)
    end

end
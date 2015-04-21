# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#order_address').autocomplete
    source: (request, response) ->
      $.ajax
        url : "http://api.cdek.ru/city/getListByTerm/jsonp.php?callback=?",
        dataType : "jsonp"
        data:
          q: ->
            $('#order_address').val()
          name_startsWith: ->
            $('#order_address').val()
        success: (data)->
          response($.map(data.geonames, (item) ->
            label : item.name,
            value : item.name,
            id : item.id
          ))
          return
      return

    minLength: 1

    select: (event, ui) ->
      $.ajax
        url: '/delivery_price'
        method: 'get'
        dataType: 'json'
        data:
          city_id: ui.item.id
        success: (data)->
          $('#receiverCityId').html(
            """
            <div class='delivery'>
              <h3>Курьерская служба </h3>
              <div class='price'>
                Цена:
                #{data.result.price}
              </div>
              <div class='period'>
                Вермя доставки:
            """ +
              if (data.result.deliveryPeriodMin is data.result.deliveryPeriodMax)
                " #{data.result.deliveryPeriodMin} дня(ей) "
              else
                " #{data.result.deliveryPeriodMin} - #{data.result.deliveryPeriodMax} дня(ей) "
            +
            """
              </div>
            </div>
            """
          )
          return
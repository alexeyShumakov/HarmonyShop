# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#order_phone').mask("+7(999) 999-99-99")
  $('#order_city').autocomplete
    # TODO слишком долго подключается по запросу "Москва", исправить.
    source: (request, response) ->
      $.ajax
        url : "http://api.cdek.ru/city/getListByTerm/jsonp.php?callback=?",
        dataType : "jsonp"
        data:
          q: ->
            $('#order_city').val()
          name_startsWith: ->
            $('#order_city').val()
        success: (data)->
          data.geonames = $.grep(data.geonames, (element, index)->
            element.countryId is '1'
          )
          response($.map(data.geonames, (item) ->
            label : item.name,
            value : item.name,
            id : item.id
          ))
          return
      return

    minLength: 2

    select: (event, ui) ->
      $.ajax
        url: '/delivery_price'
        method: 'get'
        dataType: 'json'
        data:
          city: ui.item.value,
          city_id: ui.item.id

        success: (data)->
          $('.total_price').children('span').html(data.total_price)
          $('.price').children('span').html(data.delivery_price)
          $('.period').children('span').html(data.delivery_time)
          return
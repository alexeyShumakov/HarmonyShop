(function() {
  $(function() {
    $('#order_phone').mask("+7(999) 999-99-99");
    return $('#order_city').autocomplete({
      source: function(request, response) {
        $.ajax({
          url: "http://api.cdek.ru/city/getListByTerm/jsonp.php?callback=?",
          dataType: "jsonp",
          data: {
            q: function() {
              return $('#order_city').val();
            },
            name_startsWith: function() {
              return $('#order_city').val();
            }
          },
          success: function(data) {
            data.geonames = $.grep(data.geonames, function(element, index) {
              return element.countryId === '1';
            });
            response($.map(data.geonames, function(item) {
              return {
                label: item.name,
                value: item.name,
                id: item.id
              };
            }));
          }
        });
      },
      minLength: 2,
      select: function(event, ui) {
        return $.ajax({
          url: '/delivery_price',
          method: 'get',
          dataType: 'json',
          data: {
            city: ui.item.value,
            city_id: ui.item.id
          },
          success: function(data) {
            $('.total_price').children('span').html(data.total_price);
            $('.price').children('span').html(data.delivery_price);
            $('.period').children('span').html(data.delivery_time);
          }
        });
      }
    });
  });

}).call(this);

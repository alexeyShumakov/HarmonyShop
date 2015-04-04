$ ->
  line_item = '#line_item_' + '<%= @line_item.id %>'

  $(line_item).find('.total-price').html('<%= number_to_currency(@line_item.total_price,
                                                                 separator: ",",
                                                                 delimiter: " ",
                                                                 format: "%n" ) %>')
  $('.counter').html('<%= @line_item.cart.total_quantity %>' + ' шт.')
  $('.total').html('<%= rus_number_to_currency(@line_item.cart.total_price) %>')
  $('.cart-total-price').children('strong').html('<%= rus_number_to_currency(@cart.total_price) %>')
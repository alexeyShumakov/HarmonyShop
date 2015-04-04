$ ->
  $('.counter').html(<%= @cart.total_quantity %> + ' шт.')
  $('.total').html('<%= rus_number_to_currency(@cart.total_price) %>')
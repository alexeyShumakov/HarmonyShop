$ ->
  line_item = '#line_item_' + '<%= @line_item.id %>'
  $(line_item).remove()

  $('.counter').html('<%= @line_item.cart.total_quantity %>' + ' шт.')
  $('.total').html('<%= rus_number_to_currency(@line_item.cart.total_price) %>')
  $('.cart-total-price').children('strong').html('<%= rus_number_to_currency(@line_item.cart.total_price) %>')
  if '<%= @line_item.cart.total_price %>' == '0'
    $('.cart-total-price').remove()
    $('.order-complete').remove()
    $('.cart-items').remove()
    $('.order-details').append('Корзина пуста')
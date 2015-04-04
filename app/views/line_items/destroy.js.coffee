$ ->
  line_item = '#line_item_' + '<%= @line_item.id %>'
  $(line_item).remove()

  $('.counter').html('<%= @line_item.cart.total_quantity %>' + ' шт.')
  $('.total').html('<%= rus_number_to_currency(@line_item.cart.total_price) %>')


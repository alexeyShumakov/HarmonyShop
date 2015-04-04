# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.plus').click ->
    quantity_node = $(this).siblings('.line_item_quantity').children('.quantity')
    count = parseInt(quantity_node.val(), 10)
    if count < 1
      quantity_node.val(1)
    else
      quantity_node.val(count + 1)

  $('.minus').click ->
    quantity_node = $(this).siblings('.line_item_quantity').children('.quantity')
    count = parseInt(quantity_node.val(), 10)
    if count <= 2
      quantity_node.val(1)
    else
      quantity_node.val(count - 1)

  $('input').blur ->
    $(this).closest('form').submit()
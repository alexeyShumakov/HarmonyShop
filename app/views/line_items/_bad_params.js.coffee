$ ->
  $('body').prepend('<%= escape_javascript (render partial: 'line_items/size_error') %>')
  $('.overlay').click ->
    $('.modal').remove()
  .children().click ->
    return false
  $('.error-ok').click ->
    $('.modal').remove()
    return false
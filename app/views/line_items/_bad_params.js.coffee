$ ->
  $('body').prepend('<%= escape_javascript (render partial: 'line_items/size_error') %>')
  result_width = ($(window).width() - $('.modal-content').width())/2
  $('.modal-content').css('left',result_width)
  $('.overlay').click ->
    $('.modal').remove()
  .children().click ->
    return false
  $('.error-ok').click ->
    $('.modal').remove()
    return false
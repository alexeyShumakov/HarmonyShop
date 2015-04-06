$ ->
  $('body').prepend('<%= escape_javascript (render @size_helper) %>')

  result_width = ($(window).width() - $('.modal-content').width())/2
  $('.modal-content').css('left',result_width)
  $('.overlay').click ->
    $('.modal').remove()
  .children().click ->
    return false
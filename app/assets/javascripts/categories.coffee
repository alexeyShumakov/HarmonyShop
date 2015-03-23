# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



ready = ->
  gt = $('.go-top')
  $(window).scroll(->
    scrolled = $(window).scrollTop()
    if scrolled > 600
      gt.fadeIn('fast')
    else
      gt.fadeOut('fast')
  )
  gt.click(=>
    $('html, body').animate(scrollTop: "0", 200);
  )

  $(window).scroll(->
    gt.offset(left: -2)
  )

$(document).ready(ready)
$(document).on('page:load', ready)
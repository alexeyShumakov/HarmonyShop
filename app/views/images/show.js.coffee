$ ->
  $('.photo').html  "<%= escape_javascript render(@image) %>"
  $('.carousel').html "<%= escape_javascript render(:partial => 'images/small_images',
                                                    :locals => {:current_color => @products_color,
                                                                :current_image => @image}) %>"
$ ->
  $('.photo').html  "<%= escape_javascript render(@products_color.images.first) %>"
  $('.carousel').html "<%= escape_javascript render(:partial => 'images/small_images',
                                                    :locals => {:current_color => @products_color,
                                                                :current_image => @products_color.images.first}) %>"

  $('.select-color').children('ul').html "<%= escape_javascript render(
                                              :partial => 'products_colors/products_color',
                                              :collection => @product.products_colors,
                                              :locals => {:current_color => @products_color })%>"
  $('.select-size').children('ul').html "<%= escape_javascript render(@products_color.products_colors_sizes) %>"
  $('.color').children('span').html '<%= @products_color.color.name %>'

$ ->
  $('.select-size').children('ul').html "<%= escape_javascript render(:partial => 'products_colors_sizes/products_colors_size',
                                                                      :collection => @products_color.products_colors_sizes,
                                                                      :locals => {:current_pcs => @products_colors_size}) %>"
$ ->
  $('.select-size').children('ul').html "<%= escape_javascript render(:partial => 'products_colors_sizes/products_colors_size',
                                                                      :collection => @products_color.products_colors_sizes,
                                                                      :locals => {:current_pcs => @products_colors_size}) %>"
  $('.order').html "<%= escape_javascript render(:partial => 'products/add_to_cart',
                                                  :locals => {:product_id => @products_color.product.id,
                                                              :color => @products_color.color.name,
                                                              :size  => @products_colors_size.size.name})%>"
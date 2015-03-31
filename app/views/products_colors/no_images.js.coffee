$ ->
  $('.color').children('span').html '<%= @products_color.color.name %>'
  $('.select-size').children('ul').html "<%= escape_javascript render(@products_color.products_colors_sizes) %>"
  $('.select-color').children('ul').html "<%= escape_javascript render(
                                              :partial => 'products_colors/products_color',
                                              :collection => @product.products_colors,
                                              :locals => {:current_color => @products_color })%>"
  $('.carousel').html ''
  $('.photo'). html 'Нет изображения'
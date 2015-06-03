(function() {
  $(function() {
    $('.plus').click(function() {
      var count, quantity_node;
      quantity_node = $(this).siblings('.line_item_quantity').children('.quantity');
      count = parseInt(quantity_node.val(), 10);
      if (count < 1) {
        return quantity_node.val(1);
      } else {
        return quantity_node.val(count + 1);
      }
    });
    $('.minus').click(function() {
      var count, quantity_node;
      quantity_node = $(this).siblings('.line_item_quantity').children('.quantity');
      count = parseInt(quantity_node.val(), 10);
      if (count <= 2) {
        return quantity_node.val(1);
      } else {
        return quantity_node.val(count - 1);
      }
    });
    return $('input').blur(function() {
      return $(this).closest('form').submit();
    });
  });

}).call(this);

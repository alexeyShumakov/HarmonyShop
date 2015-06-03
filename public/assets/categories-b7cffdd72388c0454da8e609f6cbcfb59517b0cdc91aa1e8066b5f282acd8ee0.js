(function() {
  var ready;

  ready = function() {
    var gt;
    gt = $('.go-top');
    $(window).scroll(function() {
      var scrolled;
      scrolled = $(window).scrollTop();
      if (scrolled > 600) {
        return gt.fadeIn('fast');
      } else {
        return gt.fadeOut('fast');
      }
    });
    gt.click((function(_this) {
      return function() {
        return $('html, body').animate({
          scrollTop: "0"
        }, 200);
      };
    })(this));
    return $(window).scroll(function() {
      return gt.offset({
        left: -2
      });
    });
  };

  $(document).ready(ready);

  $(document).on('page:load', ready);

}).call(this);

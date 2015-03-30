$(document).ready ->
  $('.photo').html  "<%= escape_javascript render(@image) %>"
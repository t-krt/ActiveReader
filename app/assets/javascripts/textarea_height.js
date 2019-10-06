$(document).on("ready turbolinks:load", function() {
  let $textarea = $('.textarea');
  let lineHeight = parseInt($textarea.css('lineHeight'));
  $textarea.on('input', function(e) {
    var lines = ($(this).val() + '\n').match(/\n/g).length;
    $(this).height(lineHeight * lines);
  });
});

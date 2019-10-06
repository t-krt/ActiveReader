$(document).on("turbolinks:load", function() {
  let ratingScore = $('#star').data("rating-score");

  $('#star').raty({
    size: 36,
    starOff:  image_path('star-off.png'),
    starOn : image_path('star-on.png'),
    scoreName: 'review[rate]',
    score: ratingScore
  });
});

$(document).on("turbolinks:load", function() {
  $('.read-only-rate').each(function(){
    let rateId = $(this).data("rated-star-id");
    let rateScore = $(this).data("rated-star-score");

    $(`#star-rate-${rateId}`).raty({
      size: 36,
      starOff: image_path('star-off.png'),
      starOn : image_path('star-on.png'),
      starHalf: image_path('star-half.png'),
      readOnly: true,
      score: rateScore
    });
  });

  let averageScore = $('.average-rate').data("average-score")
  $('.average-rate').raty({
    size: 36,
    starOff: image_path('star-off.png'),
    starOn : image_path('star-on.png'),
    starHalf: image_path('star-half.png'),
    scoreName: 'review[rate]',
    round : { down: .25, full: .74, up: .99 },
    readOnly: true,
    score: averageScore
  });
});


$(document).on("turbolinks:load", function() {
  $('.read-only-rate').each(function(){
    let rateId = $(this).data("rated-star-id");
    let rateScore = $(this).data("rated-star-score");

    $(`#star-rate-${rateId}`).raty({
      size: 36,
      starOff:  image_path('star-off.png'),
      starOn : image_path('star-on.png'),
      starHalf: image_path('star-half.png'),
      readOnly: true,
      score: rateScore
    });
  });
});

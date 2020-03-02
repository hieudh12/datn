$(function() {
  var recipe_id = $('#recipe-id').data('recipe_id');
  var rate = $('#rate-score').data('rate');
  if (rate != '') {
    $('#star' + rate).prop('checked', true);
  }

  $('.star-rating').on('click', function() {
    rate = $(this).val();
    $.post('/ratings', { id: recipe_id, rate: rate }, function() {
      location.reload();
      console.log("Rated");
    });
  })
})

$(function() {
  $(".recipe-bookmark").on('click', function() {
    var recipe_id = $(this).data('recipe_id');
    var that = $(this);
    if ($(this).hasClass('far')) {
      $(this).removeClass('far');
      $.post('/bookmarks', { id: recipe_id }, function(data) {
        that.addClass('fas');
        location.reload();
        console.log("Added bookmark");
      });
    } else if ($(this).hasClass('fas')) {
      $(this).removeClass('fas');
      $.ajax({
        url: '/bookmarks/' + recipe_id,
        type: 'DELETE',
        success: function(result) {
          that.addClass('far');
          location.reload();
          console.log("Deleted bookmark");
        }
      });
    }
  });
})


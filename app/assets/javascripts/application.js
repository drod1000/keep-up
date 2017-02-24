//= require jquery
//= require bootstrap-sprockets

$(document).ready(function(){

  $('form').on('submit', function(){

    var list = $('form input');
    var listName = list.val();

    $.ajax({
      type: 'POST',
      url: '/api/v1/lists?list_name=' + listName,
      success: function(json) {
        location.reload(true);
      }
    });
  });
});

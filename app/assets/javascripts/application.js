//= require jquery
//= require bootstrap-sprockets

$(document).ready(function(){

  $('form').on('submit', function(){

    var list = $('form input');
    var listName = list.val();
    var userId = $(this).attr('id')

    $.ajax({
      type: 'POST',
      url: '/api/v1/lists?user_id=' + userId + '&list_name=' + listName
    });
  });
});

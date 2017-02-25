$(document).ready(function(){

  $('.list-form').on('submit', function(){
    event.preventDefault();
    var list = $('form input');
    var listName = list.val();

    return $.ajax({
      type: 'POST',
      url: '/api/v1/lists?list_name=' + listName
    }).done(function(response){
      location.reload();
    });
  });
});

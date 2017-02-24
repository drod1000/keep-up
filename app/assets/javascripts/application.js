//= require jquery
//= require bootstrap-sprockets

$(document).ready(function(){

  $('.list-form').on('submit', function(){

    var list = $('form input');
    var listName = list.val();

    $.ajax({
      type: 'POST',
      url: '/api/v1/lists?list_name=' + listName
    }).done(function(response){
      location.reload();
    });
  });

  $('.article-form').on('submit', function(){
    var article = $('form input');
    var articleUrl = article.val();
    var listId = $(this).attr('id');
    url = '/api/v1/articles?list_id=' + listId + '&url=' + articleUrl;
    console.log(url);
    $.ajax({
      type: 'POST',
      url: '/api/v1/articles?list_id=' + listId + '&url=' + articleUrl
    }).done(function(response){
      location.reload();
    });
  });
});

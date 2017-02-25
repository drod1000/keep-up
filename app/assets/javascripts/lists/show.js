$(document).ready(function(){
  $('.article-form').on('submit', function(){
    event.preventDefault();
    var article = $('form input');
    var articleUrl = article.val();
    var listId = $(this).attr('id');

    return $.ajax({
      type: 'POST',
      url: '/api/v1/articles?list_id=' + listId + '&url=' + articleUrl
    }).done(function(response){
      location.reload();
    });
  });
});

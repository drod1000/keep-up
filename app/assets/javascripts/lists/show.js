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

  $('.like-button').on('click', function(){
    event.preventDefault();
    var articleId = $(this).attr('id');
    var url = '/api/v1/articles/' + articleId

    return $.ajax({
      type: 'POST',
      url: '/api/v1/articles/' + articleId + '/like'
    }).done(function(response){
      location.reload();
    });
  });
});

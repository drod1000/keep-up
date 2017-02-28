class Api::V1::ArticlesController < Api::V1::BaseController
  def create
    list = current_user.lists.find(params[:list_id])
    @article = Article.create_with_aylien(list, params[:url])
    @article.export_speech
    render json: @article, :status => 201
  end

  def like
    article = Article.find(params[:article_id])
    article.liked_by current_user
  end

  def dislike
    article = Article.find(params[:article_id])
    article.disliked_by current_user
  end
end

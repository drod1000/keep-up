class Api::V1::ArticlesController < Api::V1::BaseController
  def create
    list = current_user.lists.find(params[:list_id])
    @article = Article.find_by(url: params[:url])
    if @article
      list.articles << @article
      render json: @article, :status => 201
    else
      @article = Article.create_with_aylien(list, params[:url])
      ExportJob.perform_later(@article)
      render json: @article, :status => 201
    end
  end

  def like
    article = Article.find(params[:article_id])
    article.liked_by current_user
    render :nothing => true, :status => 201
  end

  def dislike
    article = Article.find(params[:article_id])
    article.disliked_by current_user
    render :nothing => true, :status => 201
  end
end

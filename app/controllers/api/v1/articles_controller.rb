class Api::V1::ArticlesController < Api::V1::BaseController
  def create
    list = current_user.lists.find(params[:list_id])
    @article = list.articles.create(url: params[:url])
    render json: @article, :status => 201
  end
end

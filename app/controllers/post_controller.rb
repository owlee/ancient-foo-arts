class PostController < ApplicationController
  def index
    #depend on seed file to get articles for now.
    #Ign::ArticleApi.get_articles
    #Ign::VideoApi.get_videos

    @articles = Post.where(postable_type: Article.first.class)
    @videos = Post.where(postable_type: Video.first.class)
    @posts = Post.all.order(:publishDate).reverse
  end
end

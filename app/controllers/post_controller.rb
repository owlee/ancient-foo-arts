class PostController < ApplicationController
  def index
    binding.pry
    Ign::ArticleApi.get_articles
    Ign::VideoApi.get_videos

    @articles = Article.all
    @videos = Video.all
    @posts = @articles + @videos
    @posts = @posts.order :publishDate
  end
end

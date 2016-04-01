class PostController < ApplicationController
  def index
    @articles = Ign::Article.get_articles
    @videos = Ign::Video.get_videos
  end
end

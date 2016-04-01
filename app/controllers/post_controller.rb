class PostController < ApplicationController
  def index

    binding.pry
    @articles = Ign::Article.get_articles
    @videos = Ign::Video.get_videos

    @count = articles["count"] + videos["count"]
    @posts << articles["data"] << videos["data"]

  end
end

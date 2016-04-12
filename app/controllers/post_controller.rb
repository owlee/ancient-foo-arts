class PostController < ApplicationController
  def index
    #depend on seed file to get articles for now.
    #Ign::ArticleApi.get_articles
    #Ign::VideoApi.get_videos

    #@articles = Post.where(postable_type: Article.first.class)
    #@videos = Post.where(postable_type: Video.first.class)
    @articles = Post.all.where(postable_type: 'Article').paginate(page: params[:page], per_page: 10).order('publishDate DESC')
        # publishDate is in Post. Article.all.paginate(page: params[:page], per_page: 10).order('publishDate DESC')
    @videos = Post.all.where(postable_type: 'Video').paginate(page: params[:page], per_page: 10).order('publishDate DESC')
        # Video.all.paginate(page: params[:page], per_page: 10).order('publishDate DESC')
  end

  def appview
    @posts = Post.all.paginate(page: params[:page], per_page: 10).order('publishDate DESC')
  end

  def show

  end
end

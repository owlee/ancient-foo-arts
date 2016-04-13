class PostController < ApplicationController
  @@per_page = 10

  def index
  end

  def articles
    @articles = Post.all.where(postable_type: 'Article').paginate(page: params[:page], per_page: @@per_page).order('publishDate DESC')
    @arr = @articles.map.with_index(1)
  end

  def appview
    @posts = Post.all.paginate(page: params[:page], per_page: @@per_page).order('publishDate DESC')
  end

  def show
  end

  def videos
    @videos = Post.all.where(postable_type: 'Video').paginate(page: params[:page], per_page: @@per_page).order('publishDate DESC')
    @ocunt = @videos.count
    @arr = @articles.map.with_index(1)
  end
end

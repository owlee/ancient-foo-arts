class PostController < ApplicationController
  def index
  end

  def articles
    @articles = Post.all.where(postable_type: 'Article').paginate(page: params[:page], per_page: 10).order('publishDate DESC')
  end

  def appview
    @posts = Post.all.paginate(page: params[:page], per_page: 10).order('publishDate DESC')
  end

  def show

  end

  def videos
    @videos = Post.all.where(postable_type: 'Video').paginate(page: params[:page], per_page: 10).order('publishDate DESC')
  end
end

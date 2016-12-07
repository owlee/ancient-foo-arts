class PostController < ApplicationController
  @@per_page = 10

  def index
  end

  def articles
    #@articles = Post.all.where(postable_type: 'Article').paginate(page: params[:page], per_page: @@per_page).order('publishDate DESC')
    #@arr = @articles.map.with_index(1)

    # if the id params is present
    if params[:id]
      # get all records with id less than 'our last id'
      # and limit the results to 5
      @articles = Post.where(postable_type: 'Article').where('id < ?', params[:id]).limit(@@per_page)
    else
      binding.pry
      @articles = Post.where(postable_type: 'Article').limit(@@per_page)
      #@articles = User.limit(@@per_page)
    end

    @arr = @articles.map.with_index(1)
    respond_to do |format|
      format.html
      format.js
    end

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

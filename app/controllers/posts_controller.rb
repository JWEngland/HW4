class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def require_login
    unless current_user
      flash[:alert] = 'You must be logged in to create a post.'
      redirect_to login_path
    end
  end
  def show
    @place = Place.find(params[:id])
    @post = Post.new
    @posts = @place.posts
  end

  def create_post
    @place = Place.find(params[:id])
    @post = @place.posts.build(post_params)

    if @post.save
      redirect_to place_path(@place), notice: 'Post was successfully created.'
    else
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :date_posted, :image)
  end
end


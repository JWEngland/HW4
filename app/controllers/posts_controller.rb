class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :posted_on)
  end

  def authenticate_user
    # Add your authentication logic here
    # For example, you can use Devise gem or implement your own authentication
    # You can redirect to login page if user is not logged in
    redirect_to login_path unless current_user
  end

  def show
    @post = Post.find(params[:id])
  end
end

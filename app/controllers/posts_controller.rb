class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end
  
  def show
    @post = load_post_from_url
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def load_post_from_url
    Post.find(params[:id])
  end
end

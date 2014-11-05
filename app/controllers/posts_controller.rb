class PostsController < ApplicationController
  before_action :require_login, expect: [:index]

  def index
    @posts = region.posts.all
  end

  def new
    @post = region.posts.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to :back
    else
      render :new
    end
  end

  def show
    @post = load_post_from_url
  end

  private

  def post_params
    params.
      require(:post).
      permit(:title, :body).
      merge(region_id: params[:region_id])
  end

  def load_post_from_url
    region.posts.find(params[:id])
  end
end

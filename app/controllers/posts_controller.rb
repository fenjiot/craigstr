class PostsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @region = load_region_from_url
    @posts = @region.posts.all
  end

  def new
    @region = load_region_from_url
    @post = @region.posts.new
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
    @region = load_region_from_url
    @post = @region.posts.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    region = load_region_from_url
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to [region, @post]
    else
      render :edit
    end
  end

  def destroy
    region = load_region_from_url
    post = region.posts.find(params[:id])
    post.destroy

    redirect_to region_posts_path(region)
  end

  private

  def post_params
    params.
      require(:post).
      permit(:title, :body, :image_url, category_ids: []).
      merge(region_id: params[:region_id])
  end

  def load_region_from_url
    Region.find(params[:region_id])
  end
end

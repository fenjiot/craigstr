class SpamsController < ApplicationController
  before_action :require_admin, except: [:create]

  def show
    @posts = Post.where("spam > 0")
  end

  def create
    post = Post.find(params[:post_id])
    post.increment(:spam)
    post.save
    redirect_to :back
  end
end

class SpamsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.increment(:spam)
    post.save
    redirect_to :back
  end
end

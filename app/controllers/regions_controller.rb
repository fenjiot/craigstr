class RegionsController < ApplicationController
  before_action :require_admin, except: [:index]

  def index
    @regions = Region.all
  end

  def show
    @region = load_region_from_url
    @post = @region.posts.new
    @posts = @region.posts.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to regions_path
    end
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end

  def load_region_from_url
    Region.find(params[:id])
  end
end

class CategoriesController <ApplicationController
  before_action :require_admin, except: [:index]

  def index
    @region = load_region_from_url
    @new_category = @region.categories.new
    @categories = @region.categories.all
  end

  def create
    @region = load_region_from_url
    @new_category = @region.categories.new(category_params)
    if @new_category.save
      redirect_to categories_path
    else
      @categories = @region.categories.all
      render :index
    end
  end
  
  def show
    @region = load_region_from_url
    @category = @region.categories.find(params[:id])
  end

  private

  def category_params
    params.
      require(:category).
      permit(:text).
      merge(region_id: params[:region_id])
  end

  def load_region_from_url
    Region.find(params[:region_id])
  end

  def load_category_from_url
    Category.find(params[:id])
  end
end

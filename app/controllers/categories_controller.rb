class CategoriesController <ApplicationController
  def index
    @new_category = Category.new
    @categories = Category.all
  end

  def create
    @new_category = Category.new(category_params)
    if @new_category.save
      redirect_to categories_path
    else
      @categories = Category.all
      render :index
    end
  end
  
  def show
    @category = load_category_from_url
  end

  private

  def category_params
    params.require(:category).permit(:text)
  end

  def load_category_from_url
    Category.find(params[:id])
  end
end
